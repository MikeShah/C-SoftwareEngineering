#include <SFML/Graphics.hpp>

int main()
{
    #ifdef SOME_DEFINITION
    sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works some definition!");
    #else
    sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");
    #endif 


    sf::CircleShape shape(100.f);
    shape.setFillColor(sf::Color::Green);

    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        window.clear();
        window.draw(shape);
        window.display();
    }

    return 0;
}
