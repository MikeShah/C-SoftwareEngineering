// @d_code_smells/aggregate_globals.d

// This is Accepatble when you must have some
// global state.
// e.g. a Video Game which has lots of state.
struct MyGlobals{
	float f;
}

// Allocate one global variable on the stack
MyGlobals myGlobals;

void doSomething(){
	import std.stdio;
	myGlobals.f = 1.0f;
	writeln("myGlobals.f is: ", myGlobals.f);
}

void main(){
	import std.stdio;
	{
		// Most inner scoped variable
		float f = 7.0f;
	}
	// Local to main
	float f= 5.0f;

	writeln("I wonder which 'f' I am modifying?");
	doSomething();
	writeln("local to main f is: ", f);
}


