// @file abstract.cpp
#include <iostream>

class IShape{
    public:
        float GetArea()=0;
        int GetArea()=0;
        virtual ~IShape(){};
};

class Triangle : public IShape{
public:
     ~Triangle(){};
};


int main(){
    // This will not compile
    // IShape myShape;
    IShape* tri = new Triangle;
    tri->GetArea();

    return 0;
}


