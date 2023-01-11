//
//
// Compile with: g++ -std=c++17 decorator.cpp -o decorator

#include <iostream>
#include <string>

// Interface (or otherwise an abstract class
// in C++ terminology.
class IBeverage{
public:
	virtual ~IBeverage() { };

	std::string ingredients = "";
};


// A concrete component
// We can also add functionality (i.e. member functions)
// if we like.
class Espresso : public IBeverage{
public:
	Espresso(){
		ingredients = "Espresso ";
	}

};

// The decorator for Beverage
class IBeverageDecorator : public IBeverage{
public:
	IBeverageDecorator(IBeverage& decorator): m_Decorator(decorator){
		ingredients = decorator.ingredients;	
	}
private:
	IBeverage& m_Decorator;
};

class Caramel : public IBeverageDecorator{
public:
	Caramel(IBeverage& decorator): IBeverageDecorator(decorator){
		ingredients += "Caramal ";
	}
};

class Milk: public IBeverageDecorator{
public:
	Milk(IBeverage& decorator): IBeverageDecorator(decorator){
		ingredients += "Milk ";
	}
};

int main(int argc, char* argv[]){

	IBeverage* espresso = new Espresso();
	std::cout << "Before Decorations: " << espresso->ingredients << std::endl;

	IBeverage* withCaramel = new Caramel(*espresso);
	std::cout << "First decoration: " << withCaramel->ingredients << std::endl;

	IBeverage* withMilk = new Milk(*withCaramel);
	std::cout << "Second decoration: " << withMilk->ingredients << std::endl;

	delete espresso;
	delete withCaramel;
	delete withMilk;

	return 0;
}

