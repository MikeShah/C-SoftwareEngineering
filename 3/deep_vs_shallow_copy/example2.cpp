// @file example2.cpp
// g++ -std=c++17 example2.cpp -o prog
#include <iostream>

class NewCollection{
public:

    // This is the copy constructor that
    // C++ gives you
    NewCollection(const NewCollection& copy){
        this.m_array = copy;
    }
    

    int* m_array;   // Because this member variable
                    // will be allocated as an array
                    // we need to write our own constructor
                    // and destructor
};


int main(){

    NewCollection one;
    // Allocate our array
    // NOTE: If you only alloate say '10' ints
    //       your program may not segfault.
    //       processes are given 'some' amount of memory by default,
    //       so the behavior is undefined.
    one.m_array = new int[1000000];
    for(int i=0; i < 1000000;i++){
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

    delete[] one.m_array;
    // Now we have two pointers pointing to the same data!
    // We DID NOT get a true copy
    for(int i=0; i < 1000000;i++){
        std::cout << "two.m_array[i] = " << two.m_array[i] << std::endl;
    }

    return 0;
}


