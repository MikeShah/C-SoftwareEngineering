// @file exception.d
import std.stdio;
import std.file;
import std.string; // StringException
				   // https://dlang.org/library/std/string/string_exception.html

void main(){

	//  Use 'try-catch-finally' block
	// Can catch multiple types of exceptions
	try{
		throw new StringException("You shall not PASS!");
	}
	catch(StringException e){
		writeln("Handle String exception");
	}
	catch(Exception e)
	{
		writeln("catch all case");
	}
	finally
	{
		writeln("This block always executes");
	}
	

}
