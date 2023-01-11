// handles.cpp 

namespace sf{

    typedef struct windowObject{
        int width,height;
        const char* title;
        int limit;

    }windowObject_t;

    // Create a window
    void window(windowObject_t* window,int width,int height,const char* title){
    // ...
    }

    void setFramerateLimit(windowObject_t* window, int limit){
    // ...
    }

    void displayGraphics(windowObject_t*){
    // ...
    }
}

// Example usage:
sf::windowObject_t* window1;
sf::windowObject_t* window2;

int main(){
    sf::window(window1,200,200,"Mikes first window");
    sf::window(window2,640,480,"Mikes second window");
}


