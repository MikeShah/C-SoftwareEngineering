// Compile with: g++ -std=c++17 adapter.cpp -o adapter

#include <iostream>
#include <string>


// A way to get the interface we want
// In this 'adapter', every string that we pass in
// will be 'lower case'
// Think of this as an easy way to always construct a string
// that would always create logins that were not case-sensitive.
class StringAdapter{
private:
	std::string internalString;	// Our old interface for working with strings

	// Helper function to convert a string to lower case
	// during the construction.
	void toLower(){
		for(unsigned int i=0; i< internalString.length(); i++){
			internalString[i] = tolower(internalString[i]);
		}
	}
public:
	// Our new interface
	// Note that we are also constructing the 'old' interface
	// into our class.
	// This is the dependency.
	StringAdapter(const std::string &s);
	// Return a string
	std::string getString() const;
	// Example of the operator
	friend std::ostream& operator<<(std::ostream &out, const StringAdapter& adapter);
};

StringAdapter::StringAdapter(const std::string &s): internalString(s){
	toLower();
}

// Why return 'const'?
std::string StringAdapter::getString() const{
	return internalString;
}
	
std::ostream& operator<<(std::ostream &out, const StringAdapter& adapter){
	out << adapter.getString();
	return out;
}

int main(int argc, char* argv[]){

	std::string s{"Software Engineering"};
	StringAdapter stringAdapter(s);

	std::cout << "Original string: " << s << std::endl;
	std::cout << "String Adapter : " << stringAdapter << std::endl; 


	StringAdapter stringAdapter2("nOt CaSe SeNsItIvE");
	std::cout << "String Adapter2 : " << stringAdapter2 << std::endl; 


	return 0;
}
