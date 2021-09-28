// @file IntArray.cpp
// g++ -std=c++17 IntArray.cpp -o prog

#include <iostream>

class IntArray{
public:

    // Constructor: IntArray()

    // Destructor: ~IntArray()

    // Copy Constructor: IntArray(const IntArray& rhs_copy)

    // Copy Assignment Constructor: IntArray& operator=(const IntArray& rhs_copy)

};

int main(){
    IntArray original; // Constructor called

    IntArray second(original); // copy constructor called

    second = original;  // Copy constructor called


    return 0;
}
