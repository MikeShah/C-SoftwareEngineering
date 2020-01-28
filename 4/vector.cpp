// Compile with: g++ -std=c++17 vector.cpp -o vector
#include <iostream>
#include <vector>

int main ()
{
	// Create a vector of integers
  	std::vector<int> myints;

	myints.push_back(4); 
	myints.push_back(3); 
	myints.push_back(2); 

	// One form of iteration
	for(int i=0; i < myints.size(); i++){
		std::cout << myints.at(i) << " ";	
	}
	std::cout << std::endl;

	// Using iterators
	// We print out the value of each thing that the iterator points to.
	for (std::vector<int>::iterator it = myints.begin() ; it != myints.end(); ++it){
    	std::cout << *it << " ";
	}
	std::cout << std::endl;

  return 0;
}
