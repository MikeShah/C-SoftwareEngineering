// main.cpp 
#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>

constexpr int windowWidth{640};
constexpr int windowHeight{480};

class Circle{
    public:
        explicit Circle(bool up, bool left, float radius) : m_up(up),m_left(left),m_radius(radius) {
            // Set the initial starting point
            m_x = 5.0f;
            m_y = 5.0f;
            // Set the shapes radius
            m_shape.setPosition(m_x,m_y);
            m_shape.setRadius(m_radius);
            m_shape.setFillColor(sf::Color::Blue);
            m_shape.setOrigin(m_radius,m_radius);
        }

        ~Circle(){
        }

        void update(int xmax, int ymax){
            if(m_up){
                m_y-=1.0f;
            }else{
                m_y+=1.0f;
            }
            if(m_left){
                m_x-=1.0f;
            }else{
                m_x+=1.0f;
            }

            if(m_x <0){
                m_left=false;
            }
            if(m_x > xmax){
                m_left=true;
            }

            if(m_y < 0){
                m_up=false;
            }
            if(m_y > ymax){
                m_up=true;
            }

            m_shape.setPosition(m_x,m_y);
        }

        void draw(sf::RenderWindow& rw){
            rw.draw(m_shape);  
        }

    private:

        sf::CircleShape m_shape;

        float m_radius;
        bool m_up;
        bool m_left;
        float m_x, m_y;
};


int main(){

    // Create a window to draw graphics on
    sf::RenderWindow window{sf::VideoMode(windowWidth, windowHeight,32), "Screen Saver"}; 
    // Set the frame rate for how often teh window refreshes
    window.setFramerateLimit(60);

    // Create a cirle shape
    Circle myCircle(true,true,25.0f);

    // The main loop of an interactive graphics application.
    // Some applications are meant to run forever, so
    // this is one case where we intentionally create an
    // infinite loop until otherwise interupted.
    while(true){
        // Clear the window of any previous color
        // with a specific color.
        window.clear(sf::Color::Black);
        // Poll for events that happen in an 'event loop'
        // 
        sf::Event event;
        while(window.pollEvent(event)){
            // Terminate our infinite loop
            // if the escape key is pressed
            if(sf::Keyboard::isKeyPressed(sf::Keyboard::Key::Escape)){
                window.close();
                exit(EXIT_SUCCESS);
            }
        }

        myCircle.update(640,480);
        myCircle.draw(window);
        // Display the window
        window.display();
    }

    return 0;
}



