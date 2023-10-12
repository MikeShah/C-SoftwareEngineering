// Random number generation
import std.random;

// Load the SDL2 library
import bindbc.sdl;

// Initialize one time random number generation
Random rnd; // Global random number generator
static this(){
	rnd = Random(unpredictableSeed);
}


struct Rectangle{
    int x		= 100;
    int y		= 100;
    int w		= 100;
    int h		= 100;
    int speed	= 1;
    bool up		= true;
    bool left	= true;

    /// Initialize random values for Rectangle
    void Setup(int screenWidth, int screenHeight){
		x 		= uniform(0,screenWidth,rnd);
		y 		= uniform(0,screenHeight,rnd);
		w 		= uniform(0,50,rnd);
		h 		= uniform(0,50,rnd);
		speed 	= uniform(1,3,rnd);
	}

    // Arguments here are a little redundant--do we need them?
    // (Perhaps if the screen resizes? Hmm!)
    void Update(int screenWidth, int screenHeight){
		if(up){
				y+=speed;
				if(y>screenHeight){
					up = !up;
				}
			}

			if(!up){
				y-=speed;
				if(y<0){
					up = !up;
				}
			}
			if(left){
				x+=speed;
				if(x>screenWidth){
					left = !left;
				}
			}

			if(!left){
				x-=speed;
				if(x<0){
					left = !left;
				}
			}
	}

    // Okay, render our rectangle to a specific renderer!
    void Render(SDL_Renderer* renderer){
		SDL_Rect fillRect = SDL_Rect(x,y,w,h);
    	SDL_SetRenderDrawColor(renderer, 0xFF, 0x00, 0x00, 0xFF);
	    SDL_RenderDrawRect(renderer, &fillRect); 
	}

};
