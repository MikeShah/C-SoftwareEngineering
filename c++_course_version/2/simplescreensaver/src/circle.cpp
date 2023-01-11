#include "circle.hpp"

    Circle::Circle(bool up, bool left, float radius) : m_up(up),m_left(left),m_radius(radius) {
        // Set the initial starting point
        m_x = 5.0f;
        m_y = 5.0f;
        // Set the shapes radius
        m_shape.setPosition(m_x,m_y);
        m_shape.setRadius(m_radius);
        m_shape.setFillColor(sf::Color::Blue);
        m_shape.setOrigin(m_radius,m_radius);
    }

    Circle::~Circle(){
    }

    void Circle::update(int xmax, int ymax){
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

        if(m_x < 0){
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

    void Circle::draw(sf::RenderWindow& rw){
        rw.draw(m_shape);  
    }

