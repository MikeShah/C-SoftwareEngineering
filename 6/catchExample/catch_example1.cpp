#define CATCH_CONFIG_MAIN  	// This tells Catch to provide a main()
			   				// You will only do this in one cpp file,
			   				// even if you have multiple .cpp files
							// in your test suite.

#include "catch_amalgamated.hpp" // Here is the 'catch header' 
								 // file for the entire framework.
								 // You can download it from the 
								 // Catch2 github and put it in your 
						         // 'tests' directory.

/*! \brief A simple factorial function 
*/
unsigned int Factorial( unsigned int number ) {
    return number <= 1 ? number : Factorial(number-1)*number;
}

/*! \brief Test cases for factorial.
*/
TEST_CASE( "Factorials are computed", "[factorial]" ) {
    REQUIRE( Factorial(1) == 1 );
    REQUIRE( Factorial(2) == 2 );
    REQUIRE( Factorial(3) == 6 );
    REQUIRE( Factorial(10) == 3628800 );
}
