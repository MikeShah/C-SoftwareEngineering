// @file IntArray.cpp
// g++ -std=c++17 IntArray.cpp -o prog

#include <iostream>

class IntArray{
public:

    // Constructor: IntArray()

    // Destructor: ~IntArray()

    // Copy Constructor: IntArray(const IntArray& rhs_copy)
    // -  Don't copy yourself! 

    // Copy Assignment Constructor: IntArray& operator=(const IntArray& rhs_copy)
    // -  Don't copy yourself! 
    // -  Remember what we are returning: *this (why?)

};

int main(){
    IntArray original; // Constructor called

    IntArray second(original); // copy constructor called

    second = original;  // Copy constructor called


    return 0;
}
