// @file exception2.d
import std.stdio;
import std.file;
import std.string; // StringException
				   // https://dlang.org/library/std/string/string_exception.html

void main(){
	try{
		throw new StringException("You shall not PASS!");
	}
	catch(StringException e){
		writeln("Handle String exception");
		writeln("\tfile: ",e.file);
		writeln("\tline: ",e.line);
		writeln("\tmsg : ",e.msg);
		writeln("\tinfo: ",e.info);
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
