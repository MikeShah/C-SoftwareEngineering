/// rdmd -unittest unittester.d
module unittester;

import core.runtime;
import std.typecons;
import std.stdio;

// This is kind of a neat template trick here
// we effectively create a tuple type that is
// a variadic template.
// The alias inside of Tuple allows us to capture
// the arguments.
// This allows us at compile-time to grab collections of
// data.
template Tuple (T...)
{
    alias Tuple = T;
}

// A constructor for this module
static this(){
	// Turn off the unit test runner
	Runtime.moduleUnitTester = {return true;};

	// Retrieves unit tests
    alias tests = __traits(getUnitTests, unittester);
	writeln("Unit tests Found: ",tests.length);

	foreach(test; tests){
    	alias attributes = Tuple!(__traits(getAttributes,test));

		write(" ====== ");
		foreach(idx, attribute; attributes){
			write("[",idx,"]",attribute, " ");
		}
		write(" ======\n ");
		// Call our unit tests
		test();
	}
}

// My equivalent to an assert
bool check(bool expression,string msg)(){
	if(expression){
		return true;
	}else{
		writeln(msg);
		return false;
	}
}
//alias checkExpression = check!(bool expression,string msg)();

bool static_check(bool expression,string msg)(){
	static if(expression){
		return true;
	}else{
		writeln(msg);
		pragma(msg,"Compile-time: "~msg);
		return false;
	}
}

@("hello test","named")
unittest{
	writeln("Running a unit test");
	check!(1==2,"basic math fails")();
	static_check!(1==2,"basic math fails")();
    assert(1==1,"basic math fails");
}

@("hello test 2","named 2")
unittest{
	writeln("Running a unit test2");
    assert(1==1,"basic math fails");
}

// Entry point to program
void main(){
    import std.stdio;
	
	writeln("==== main ======");
    writeln("Hello world");
}
