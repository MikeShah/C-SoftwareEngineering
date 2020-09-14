// main.cpp 
// Third-Party Library
#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>

// Our includes
#include "circle.hpp"

// C++ Standard Template Library
#include <vector>
#include <ctime>

constexpr int windowWidth{640};
constexpr int windowHeight{480};


int main(){
	// Set random number generator here
	srand(time(NULL));
	
    // Create a window to draw graphics on
    sf::RenderWindow window{sf::VideoMode(windowWidth, windowHeight,32), "Screen Saver"}; 
    // Set the frame rate for how often the window refreshes
    window.setFramerateLimit(60);

    // Create a circle shape
	std::vector<Circle> circles;
	for(int i=0; i < 100; i++){
		Circle temp;
		circles.push_back(temp);
	}

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

		for(int i=0; i < circles.size(); i++){
			circles[i].update(640,480);
			circles[i].draw(window);
		}


        // Display the window
        window.display();
    }

    return 0;
}



