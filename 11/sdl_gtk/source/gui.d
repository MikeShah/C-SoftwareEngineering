import std.stdio;

import gtk.MainWindow;
import gtk.Main;
import gtk.Widget;
import gtk.Button;
import gdk.Event;
import gtk.Container;
import gtk.DrawingArea;
import gtk.Box;
import gtk.Layout; // put
import gtk.Menu;
import gtk.MenuBar;
import gtk.MenuItem;

// GDK functions for grabbing window
import gdk.Window;
import gdk.X11;

import glib.Idle;

// Import D standard libraries
import std.stdio;
import std.string;

// Load the SDL2 library
import bindbc.sdl;
import loader = bindbc.loader.sharedlib;


// global variable for window
Window  gdkWindowForSDL;
uint    gdkWindowXID;
// global variable for sdl;
const SDLSupport ret;
/// At the module level we perform any initialization before our program
/// executes. Effectively, what I want to do here is make sure that the SDL
/// library successfully initializes.
shared static this(){
    // Load the SDL libraries from bindbc-sdl
	// on the appropriate operating system
    version(Windows){
        writeln("Searching for SDL on Windows");
		ret = loadSDL("SDL2.dll");
	}
    version(OSX){
        writeln("Searching for SDL on Mac");
        ret = loadSDL();
    }
    version(linux){ 
        writeln("Searching for SDL on Linux");
		ret = loadSDL();
	}

	// Error if SDL cannot be loaded
    if(ret != sdlSupport){
        writeln("error loading SDL library");
        
        foreach( info; loader.errors){
            writeln(info.error,':', info.message);
        }
    }
    if(ret == SDLSupport.noLibrary){
        writeln("error no library found");    
    }
    if(ret == SDLSupport.badLibrary){
        writeln("Eror badLibrary, missing symbols, perhaps an older or very new version of SDL is causing the problem?");
    }

    // Initialize SDL
    if(SDL_Init(SDL_INIT_EVERYTHING) !=0){
        writeln("SDL_Init: ", fromStringz(SDL_GetError()));
    }
}

/// At the module level, when we terminate, we make sure to 
/// terminate SDL, which is initialized at the start of the application.
shared static ~this(){
    // Quit the SDL Application 
    SDL_Quit();
	writeln("Ending application--good bye!");
}

interface Command{
	int Execute();
	int Undo();
}

class SurfaceOperation : Command{
	SDL_Surface* mSurface;
	int mXPosition;
	int mYPosition;
	
	this(SDL_Surface* surface, int xPos, int yPos){
		mSurface = surface;
		mXPosition = xPos;
		mYPosition = yPos;
	}

	~this(){

	}

	/// Function for updating the pixels in a surface to a 'blue-ish' color.
	int Execute(){
		// When we modify pixels, we need to lock the surface first
		SDL_LockSurface(mSurface);
		// Make sure to unlock the mSurface when we are done.
		scope(exit) SDL_UnlockSurface(mSurface);

		// Retrieve the pixel arraay that we want to modify
		ubyte* pixelArray = cast(ubyte*)mSurface.pixels;
		// Change the 'blue' component of the pixels
		pixelArray[mYPosition*mSurface.pitch + mXPosition*mSurface.format.BytesPerPixel+0] = 255;
			// Change the 'green' component of the pixels
		pixelArray[mYPosition*mSurface.pitch + mXPosition*mSurface.format.BytesPerPixel+1] = 128;
			// Change the 'red' component of the pixels
		pixelArray[mYPosition*mSurface.pitch + mXPosition*mSurface.format.BytesPerPixel+2] = 32;

		return 0;
	}

	int Undo(){
		// When we modify pixels, we need to lock the surface first
		SDL_LockSurface(mSurface);
		// Make sure to unlock the mSurface when we are done.
		scope(exit) SDL_UnlockSurface(mSurface);

		// Retrieve the pixel arraay that we want to modify
		ubyte* pixelArray = cast(ubyte*)mSurface.pixels;
		// Change the 'blue' component of the pixels
		pixelArray[mYPosition*mSurface.pitch + mXPosition*mSurface.format.BytesPerPixel+0] = 0;
			// Change the 'green' component of the pixels
		pixelArray[mYPosition*mSurface.pitch + mXPosition*mSurface.format.BytesPerPixel+1] = 0;
			// Change the 'red' component of the pixels
		pixelArray[mYPosition*mSurface.pitch + mXPosition*mSurface.format.BytesPerPixel+2] = 0;
		return 0;
	}
}



// Entry point to program
void RunSDL()
{
    // Create an SDL window
    /*
    SDL_Window* window= SDL_CreateWindow("D SDL Painting",
                                        SDL_WINDOWPOS_UNDEFINED,
                                        SDL_WINDOWPOS_UNDEFINED,
                                        640,
                                        480, 
                                        SDL_WINDOW_SHOWN);
    */
    static SDL_Window* window=null;
    // Flag for determing if we are running the main application loop
    static bool runApplication = true;
    // Flag for determining if we are 'drawing' (i.e. mouse has been pressed
    //                                                but not yet released)
    static bool drawing = false;
    static Command[] CommandQueue;
    static SDL_Surface* imgSurface= null;

    writeln("hi");
    if(window==null){
        window = SDL_CreateWindowFrom(cast(const(void)*)gdkWindowXID);
        // Do some error checking to see if we retrieve a window
        if(window==null){
            writeln("SDL_GetError()",SDL_GetError());
        }
        // Load the bitmap surface
        imgSurface = SDL_CreateRGBSurface(0,640,480,32,0,0,0,0);
    }
    writeln("bye");

    if(window!=null){
        // Main application loop that will run until a quit event has occurred.
        // This is the 'main graphics loop'
        while(runApplication){
            SDL_Event e;
            // Handle events
            // Events are pushed into an 'event queue' internally in SDL, and then
            // handled one at a time within this loop for as many events have
            // been pushed into the internal SDL queue. Thus, we poll until there
            // are '0' events or a NULL event is returned.
            while(SDL_PollEvent(&e) !=0){
                if(e.type == SDL_QUIT){
                    runApplication= false;
                }
                else if(e.type == SDL_MOUSEBUTTONDOWN){
                    drawing=true;
                }else if(e.type == SDL_MOUSEBUTTONUP){
                    drawing=false;
                }else if(e.type == SDL_MOUSEMOTION && drawing){
                    // retrieve the position
                    int xPos = e.button.x;
                    int yPos = e.button.y;
                    // Loop through and update specific pixels
                    // NOTE: No bounds checking performed --
                    //       think about how you might fix this :)
                    int brushSize=4;
                    for(int w=-brushSize; w < brushSize; w++){
                        for(int h=-brushSize; h < brushSize; h++){
                            // Create a new command
                            auto command = new SurfaceOperation(imgSurface,xPos+w,yPos+h);
                            // Append to the end of our queue
                            CommandQueue ~= command;
                            // Execute the last command
                            CommandQueue[$-1].Execute();
                        }
                    }
                }
            }

            // Blit the surace (i.e. update the window with another surfaces pixels
            //                       by copying those pixels onto the window).
            SDL_BlitSurface(imgSurface,null,SDL_GetWindowSurface(window),null);
            // Update the window surface
            SDL_UpdateWindowSurface(window);
            // Delay for 16 milliseconds
            // Otherwise the program refreshes too quickly
            SDL_Delay(16);
        }

    }

    // Free the image
    scope(exit) {
//            SDL_FreeSurface(imgSurface);
    }
    // Destroy our window
//    SDL_DestroyWindow(window);
}


void QuitApp(){
	writeln("Terminating application");

	Main.quit();
}

void main(string[] args)
{
	// Initialize GTK
	Main.init(args);
	// Setup our window
	MainWindow myWindow = new MainWindow("Tutorial 02");
    myWindow.setTitle("SDL with gtk+3 example");
	// Position our window
	myWindow.setDefaultSize(640,480);
	int w,h;
	myWindow.getSize(w,h);
	writeln("width   : ",w);
	writeln("height  : ",h);
	myWindow.move(100,120);
	
	// Delegate to call when we destroy our application
	myWindow.addOnDestroy(delegate void(Widget w) { QuitApp(); });

    // Create a new Box
    const int globalPadding=2;
    auto myBox = new Box(Orientation.VERTICAL,globalPadding);

    // Create a menu bar and menu items
    auto menuBar = new MenuBar;
    auto menuItem1 = new MenuItem("File");
    menuBar.append(menuItem1);

    // Create a menu for our menu item
    auto menu1 = new Menu;
    auto menuNew  = new MenuItem("New");
    auto menuExit = new MenuItem("Exit");

    // Add some functions to our menu 
    // We use a delagate, and observe this time that we are
    // using 'MenuItem m' as our parameter because that is the type.
    menuNew.addOnActivate(delegate void (MenuItem m){writeln("pressed new");}); 

    // Append menu items to our menu
    menu1.append(menuNew);
    menu1.append(menuExit);
    // Attach this menu item as a submenu
    menuItem1.setSubmenu(menu1);
         
    // Add menu and do not expand or fill or pad 
    myBox.packStart(menuBar,false,false,0);

	// We'll now create a 'button' to add to our aplication.
	Button myButton1 = new Button("Button1 Text");
	Button myButton2 = new Button("Button2 Text");
	Button myButton3 = new Button("Button3 Text");

    Layout myLayout = new Layout(null,null);
    myLayout.put(myButton3,0,0);

    const int localPadding= 2;
    //              button    expand fill padding
    myBox.packStart(myButton1,true,true,localPadding);
    myBox.packStart(myButton2,true,true,localPadding);
    myBox.packStart(myLayout,true,true,localPadding);

	// Action for when we click a button
//	myButton1.addOnClicked(delegate void(Button b) {
//							writeln("myButtonClicked");
//						});

	// Action for when mouse is released
//	myButton1.addOnReleased(delegate void(Button b){
//							writeln("myButtonReleased");
//						});
 
    // Create a new drawing area
    auto gtkDrawingArea = new DrawingArea;
    gtkDrawingArea.setSizeRequest(640,480);
    myBox.packStart(gtkDrawingArea,true,true,localPadding);

    // Add to our window the box
    // as a child widget
    myWindow.add(myBox);

    // Create a container to store the drawing area
    auto myContainer = new GtkContainer;
    //myContainer.add(gtkDrawingArea);
    //myWindow.add(myContainer);
    
	// Show our window
	myWindow.showAll();

    cast(gulong)gdk_quartz_window_get_nsview(gtk_widget_get_window((gtkDrawingArea.getWindow())));

    // Useful information for SDL within a GTK window
    // https://stackoverflow.com/questions/47284284/how-to-render-sdl2-texture-into-gtk3-window
    //auto gdk_window = gtk_widget_get_window(GTK_WIDGET(myWindow));
    //auto window_id = cast(void*)cast(int*)GDK_WINDOW_XID(gtkDrawingArea);
    gtkDrawingArea.realize(); // May not be necessary, but forces component to be built first
    gdkWindowForSDL = gtkDrawingArea.getWindow(); 
    gdkWindowXID = gdkWindowForSDL.getXid();

    writeln(typeid(gdkWindowForSDL));

    // Creating a new idle event will fire whenever there is not anything
    // else to do
    auto idle = new Idle(delegate bool(){ RunSDL(); return true;});

	// Run our main loop
	Main.run();
}
