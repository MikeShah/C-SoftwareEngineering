// @file assertThrowable_example.d
// rdmd -unittest assertThrowable_example.d

unittest{
	import std.exception;
	import core.exception;

	int[] data;

	// Assert that an exception is thrown 
	assertThrown(enforce(0 > 1,"condition of 0 > 1 is false, so exception is thrown"));

}


void main(){

}
