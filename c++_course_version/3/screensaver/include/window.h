// window.h
#ifndef WINDOW_H
#define WINDOW_H
namespace sf{

    class window{
    public:
        // Create a window
        window(int width,int height,const char* title);

        void setFramerateLimit(int limit);

        void displayGraphics();


    private:
            int width,height;
            const char* title;
            int limit;
    };

}
#endif
