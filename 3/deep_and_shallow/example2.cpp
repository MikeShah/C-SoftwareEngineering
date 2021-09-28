// @file example2.cpp
// g++ -std=c++17 example2.cpp -o prog
#include <iostream>

class NewCollection{
public:

    int* m_array;   // Because this member variable
                    // will be allocated as an array
                    // we need to write our own constructor
                    // and destructor
};


int main(){

    NewCollection one;
    // Allocate our array
    one.m_array = new int[100];
    for(int i=0; i < 100;i++){
        one.m_array[i] = i;
    }
    // Here we are creating a copy of 'one'
    // by assigning it to 'two'
    NewCollection two = one;

    // If we print out the addresses of m_array, we'll see
    // a copy was created with different addresses.
    // BUT -- the data we are pointing to is not the same
    std::cout << "&one.m_array: " << &one.m_array << std::endl;
    std::cout << "&two.m_array: " << &two.m_array << std::endl;

    // Now we have two pointers pointing to the same data!
    // We DID NOT get a true copy
    for(int i=0; i < 100;i++){
        std::cout << "two.m_array[i] = " << two.m_array[i] << std::endl;
    }

    return 0;
}


