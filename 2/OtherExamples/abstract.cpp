// @file abstract.cpp
// Class name usuall prefixed with 'I' if it
// is intended to be an interface (a.k.a abstract class)
class IShape{
    public:
        // Member function declaration as
        // virtual means it will be overriden
        // by derived classes.
        //
        // In C++ we set =0 if it MUST be overriden
        // (therefore it must be implemented in
        //  any derived class).
        // We call this a pure virtual function
        virtual int GetArea() =0;    
        // Destructor made virtual, because we want
        // to implement destructor in derived class
        virtual ~IShape();
};

int main(){

    // This will not compile
    // IShape myShape;

    return 0;
}


