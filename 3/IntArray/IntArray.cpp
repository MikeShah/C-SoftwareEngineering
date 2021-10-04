// @file IntArray.cpp
// g++ -std=c++17 IntArray.cpp -o prog

#include <iostream>

class IntArray{
public:

    // Constructor: IntArray()
    IntArray(){
        m_data = new int[10];
        for(int i=0; i< 10; i++){
            m_data[i] = i;
        }
        std::cout << "Constructor called\n";
    }
    // Destructor: ~IntArray()
    ~IntArray(){
        delete[] m_data;
        std::cout << "Destructor called\n";
    }

    // Copy Constructor: IntArray(const IntArray& rhs_copy)
    // -  Don't copy yourself! 
    IntArray(const IntArray& rhs_copy){ 
        std::cout << "Copy Constructor\n";
        m_data = new int[10];
        for(int i=0; i< 10; i++){
            m_data[i] = rhs_copy.m_data[i];
        }
    }
    // Copy Assignment Constructor: IntArray& operator=(const IntArray& rhs_copy)
    // -  Don't copy yourself! 
    // -  Remember what we are returning: *this (why?)
    IntArray& operator=(const IntArray& rhs_copy){
        if(this == &rhs_copy){
            return *this;
        }
        std::cout << "Copy Assignment\n";
        if(m_data != nullptr){
            delete[] m_data;
        }
        m_data = new int[10];
        for(int i=0; i< 10; i++){
            m_data[i] = rhs_copy.m_data[i];
        }
        // second = original
        return *this;
    }

    void printData(){
        for(int i=0; i< 10; i++){
            std::cout << "data:" << m_data[i] << std::endl;
        }
    }

    int* m_data;

};

void foo(IntArray test){


}



int main(){
    IntArray original; // Constructor called

    foo(original);

    //IntArray second(original); // copy constructor called
    
    // Copy assignment occurs, when object
    // has already been instantiated
    //second = original;  // Copy Assignment

    //second = second;
    //std::cout << &original << std::endl;

    return 0;
}
