// @file assertion.d
import std.stdio;

void main(){
	
	// Note: Assertions are always compiled into the code
	//       when used in a function.
	// 		 When we talk about contracts later, those are
	// 		 only compiled in during -release builds.
	assert(2+2 == 4);
	writeln("All is well, no fatal flaws in math");

	assert(2+2==5);
	writeln("If the above is true, laws of universe are broken!");
}
