// Pleasea read first: https://www.learncpp.com/cpp-tutorial/96-overloading-the-comparison-operators/
// Example written and last updated 9/30/20
// g++ -std=c++17 comparisonoperator.cpp -o comparisonoperator

#include <iostream>
#include <vector>

// Create a class to use as an example.
// It has two fields within it, and we may want
// to compare objects to see if they are eqal.
class object{
public:
    int field1;
    std::vector<float> field2;

    // The 'friend' keyword gives this function access to
    // the public, protected, and private member variables and functions
    // for this object.
    friend bool operator==(const object& ob1, const object& ob2);
};

// Comparison of two 'object' types
// This is a 'free standing' function and is not part of the class 'object'
// however, it does have access to ob1 and ob2 member variables and member functions
// because it is declared as a 'friend' in our class.
bool operator==(const object& ob1, const object& ob2){
    std::cout << "Comparison operator invoked for object\n";

    if(ob1.field1 != ob2.field1){
        return false;
    }

    if(ob1.field2 != ob2.field2){
        return false;
    }

    return true;
}


int main(){
    // Create some objects
    object o1;
    object o2;
    object o3;
    
    // Set their values
    o1.field1 = 1;
    o2.field1 = 1;
    o3.field1 = 3;
    // Make o3's second field slightly different for illustration purposes
    // (i.e. one object should fail our == operator)
    o3.field2.push_back(7);

    if(o1==o2){ 
        std::cout << "o1==o2\n";
    }

    if(o1==o3){
        std::cout << "o1==o3\n";
    }else{
        std::cout << "o1!=o3\n";
    }


    return 0;
}
