// @file exception3.d
import std.stdio;
import std.file;
import std.string; // StringException
				   // https://dlang.org/library/std/string/string_exception.html
void main(){

	float a=7.0;
	float b=0.0;
	float result;
	// Try block purpose is for handling operations which 'may'
	// be problematic in the 'exceptional' case. e.g. division.
	try{
		result = a / b;
		writeln("try block: result = ",result);
		if(result == float.infinity){
			throw new Exception("Ooops, divided by zero!");
		}
	}
	catch(Exception e)
	{
		// Catch block we handle
		writeln("You divided by zero!");
		// Maybe put our program back in a good state.
		// Here is where we 'handle' the specific (or generic)
		// type of exception.
		result = 0;
	}
	finally
	{
		// Potentially free/release resources
		writeln("This block always executes");
	}
	writeln("result: ",result);

}
