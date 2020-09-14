// procedural.cpp 
//
// Create a window
void window(int width,int height, const char* title){
// ...
}

void setFramerateLimit(int limit){
// ...
}

void displayGraphics(){
// ...
}

int main(){

    // Create a window to draw graphics on
    void window(800,600,"pong");
    // Set the frame rate for how often the window refreshes.
    void setFrameRateLimiti(60);

    // The main loop of an interactive graphics application
    // Some applications are meant to run forever, so
    // this is one case where we intentionally create an
    // infinite loop
    while(true){
        // Clear the window of any previous contents
        clear(0,0,0);

        // Terminate our infinite loop
        if(isKeyPressed(113)){
            break;
        }

        // Display the window
        displayGraphics();
    }

    return 0;
}

