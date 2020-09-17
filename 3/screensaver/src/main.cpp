// main.cpp 
// Third-Party Library
#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>

// Our includes
#include "circle.hpp"
#include "ConfigurationManager.hpp"
#include "AdapterText.hpp"

// C++ Standard Template Library
#include <vector>
#include <ctime>



int main(){
	// Set random number generator here
	srand(time(NULL));

    ConfigurationManager::instance().setWindowWidth(640);
    ConfigurationManager::instance().setWindowHeight(480);

    // Create a window to draw graphics on
    sf::RenderWindow window{sf::VideoMode(ConfigurationManager::instance().getWindowWidth(), 
                                          ConfigurationManager::instance().getWindowHeight(),
                                          32),
                            "Screen Saver - Singleton!"}; 

    // Set the frame rate for how often the window refreshes
    window.setFramerateLimit(60);

    // Load a font
    sf::Font font;
    font.loadFromFile("./resources/fonts/futrfw.ttf");
    // Create some text
    sf::Text text;
    text.setFont(font);
    text.setFillColor(sf::Color::Red);
    // ... //
    text.setString("ScreenSaver Company");

    // Create an Adapter sometime after
    // our previous Text was created.
    AdapterText adapterText(text);


    // Create a circle shape
	std::vector<Circle> circles;
	for(int i=0; i < 1000; i++){
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

		for(std::vector<Circle>::iterator it = circles.begin();
            it != circles.end();
            it++)
        {
            sf::Vector2u windowSize = window.getSize();
			it->update(windowSize.x,windowSize.y);
			it->draw(window);
		}

        // Display our font
//        window.draw(text);
        // Replace our original draw
        adapterText.draw(window);
        // Display the window
        window.display();
    }

    return 0;
}
