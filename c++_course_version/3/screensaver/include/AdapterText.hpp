// AdapterText.hpp
#ifndef ADAPTERTEXT_H
#define ADAPTERTEXT_H

#include <SFML/Graphics.hpp>

// Simple (Object) Adapter Pattern
class AdapterText{
    public:
       AdapterText(sf::Text text);
       void draw(sf::RenderWindow& window);
    private:
        sf::Text m_internalText;
};


#endif





