// Import D standard libraries
import std.stdio;
import std.string;

// Load the SDL2 library
import bindbc.sdl;
import loader = bindbc.loader.sharedlib;

// Load other project modules
import Rectangle : Rectangle;

void main()
{
    // Load the SDL libraries from bindbc-sdl
    // NOTE: Windows users may need this
    version(Windows) const SDLSupport ret = loadSDL("SDL2.dll");
    // NOTE: Mac users may need this
    version(OSX){
        writeln("Searching for SDL on Mac");
        const SDLSupport ret = loadSDL();
    }
    // NOTE: Linux users probably need this
    version(linux) const SDLSupport ret = loadSDL();
    
    if(ret != sdlSupport){
        writeln("error loading SDL library");
        
        foreach( info; loader.errors){
            writeln(info.error,':', info.message);
        }
    }
    if(ret == SDLSupport.noLibrary){
        writeln("error no library");    
    }
    if(ret == SDLSupport.badLibrary){
        writeln("Eror badLibrary, missing symbols");
    }

    // Initialize SDL
    if(SDL_Init(SDL_INIT_EVERYTHING) !=0){
        writeln("SDL_Init: ", fromStringz(SDL_GetError()));
    }

    // Create an SDL window
    SDL_Window* window= SDL_CreateWindow("D example window",
                                        SDL_WINDOWPOS_UNDEFINED,
                                        SDL_WINDOWPOS_UNDEFINED,
                                        640,
                                        480, 
                                        SDL_WINDOW_SHOWN);
    // Load the bitmap surface
    SDL_Surface* imgSurface = SDL_LoadBMP("./test.bmp");
    // Blit the surace
    SDL_BlitSurface(imgSurface,null,SDL_GetWindowSurface(window),null);
    // Update the window
    SDL_UpdateWindowSurface(window);
    // Delay for 1000 milliseconds
    SDL_Delay(1000);
    // Free the image
    SDL_FreeSurface(imgSurface);


	// Create a hardware accelerated renderer
    // It can be useful to 'clear' the errors beforehand in SDL
    SDL_ClearError();
    // Pointer to our renderer
    SDL_Renderer* renderer;
    // On Mac's, it's possible that creating the window will also create
    // the renderer, so we should check first.
    if(SDL_GetRenderer(window)==null){
       renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    }else{
        renderer = SDL_GetRenderer(window);
    }
    // If there's still an error, then convert the const char* and write
    // out the string
	if(renderer==null){
        import std.conv;
		writeln("renderer ERROR: ", to!string(SDL_GetError()));
	}



	// Create a bunch of Rectangles
	Rectangle[50] rectangles;
	foreach(ref element; rectangles){
		element.Setup(640,480);
	}

	// Run the main application  loop
	bool runApplication = true;
	while(runApplication){
		SDL_Event e;
		// Handle events
		while(SDL_PollEvent(&e) !=0){
			if(e.type == SDL_QUIT){
				runApplication= false;
			}
		}
		// Clear the screen 
		SDL_SetRenderDrawColor(renderer, 0x22,0x22,0x55,0xFF);
		SDL_RenderClear(renderer);

		foreach(ref element ; rectangles){
			element.Update(640,480);
			element.Render(renderer);
		}

		SDL_RenderPresent(renderer);
		// Artificially slow things down
		SDL_Delay(16);
	}

	// Destroy our Renderer
	SDL_DestroyRenderer(renderer);
    // Destroy our window
    SDL_DestroyWindow(window);
    // Quit the SDL Application 
    SDL_Quit();

	writeln("Ending application--good bye!");

}
