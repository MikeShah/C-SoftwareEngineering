// @file unit_test_block.d
// Run with dmd:
// rdmd -unittest -main unit_test_block.d
// NOTE: -unittest compiles in the unittests to be run 
//       so you can otherwise just compile your program
//       if you like and then run it as shown below.
// dmd -unittest -main unit_test_block.d && ./unit_test_block
import std.stdio;

/// square function with floating point precision
auto squaref(float value){
	return value * value;
}

/// Documentation string describing the purpose
/// of testing 'sqauref' or otherwise showing an
/// example of the code.
unittest{
	assert(squaref(5.0f) == 25.0f);

	// NOTE: Depending on our library, we might
	//       want an 'exact' match and precision.
	// 		 Sometimes, however we might want a
   	// 		'close enough' approximation.
	// 
	import std.math.operations;
	assert(isClose(squaref(5.0f), 25.0f));
	writeln("executed");
}

