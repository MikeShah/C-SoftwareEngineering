// @d_code_smells/globals.d

// This is BAD
// Global names should stand out!
float f;

void doSomething(){
	import std.stdio;
	f = 1.0f;
	writeln("global f is: ", f);
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

	// Local variables however, it's more acceptable to 
	// have short conventions for names.
	for(int i=0; i < 10; i++){
		writeln("i is probably okay for 'index': ", i);
	}

}


