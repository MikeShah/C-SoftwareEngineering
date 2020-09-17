// AdapterText.cpp

#include "AdapterText.hpp"
#include <string>

AdapterText::AdapterText(sf::Text text){
   m_internalText = text;

   m_internalText.setCharacterSize(24);
   m_internalText.setFillColor(sf::Color::Green);
   std::string original = text.getString();
   for(size_t i=0; i < original.length();i++){
        original[i] = std::toupper(original[i]);
   }
   m_internalText.setString(original);

}

void AdapterText::draw(sf::RenderWindow& window){
    window.draw(m_internalText);
}
