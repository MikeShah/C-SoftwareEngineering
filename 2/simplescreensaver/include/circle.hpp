#ifndef CIRCLE_H
#define CIRCLE_H

#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>

#include <stdlib.h>     /* srand, rand */
#include <time.h>       /* time */

// Purpose
// How to use or a usage example

class Circle{
    public:

    Circle(bool up, bool left, float radius);

    ~Circle();

    void update(int xmax, int ymax);

    void draw(sf::RenderWindow& rw);

    private:

        sf::CircleShape m_shape;
        float   m_radius;
        bool    m_up;
        bool    m_left;
        float   m_x;
        float   m_y;
};

#endif
