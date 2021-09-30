// @file IntArray.cpp
// g++ -std=c++17 IntArray.cpp -o prog

#include <iostream>

class IntArray{
public:

    // Constructor: IntArray()
    IntArray(){
    }
    // Destructor: ~IntArray()
    ~IntArray(){
    }


    void printData(){
        for(int i=0; i < 10; i++){
            std::cout << "data: " << m_data[i] << std::endl;
        }
    }

private:
    std::vector<int> m_collection;
};

// Pass by value 
void foo(IntArray myArray){
    myArray.printData();
}

int main(){
    // Constructor called
    IntArray* original;
    original = new IntArray;
    // copy constructor called
//    IntArray second(original);
    // Copy assignment called
//    second = original;

//    IntArray third = original;

   // second.printData();

    //foo(original);
    delete original;

    return 0;
}
