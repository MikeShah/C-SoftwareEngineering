// @file exception4.d
import std.stdio;

void main(){

	try{
		// Block of code to try
		// ...
		// And if something goes wrong, we can 'throw'
		throw new Exception("Something exceptional happened");
	}
	catch(Exception e)
	{
		// Generic catch any 'Exception'
		// Goal is to log or otherwise handle exception
	}
	finally
	{
		// Potentially free/release resources
		// Last block that will always run
		writeln("This block always executes");
	}

}


