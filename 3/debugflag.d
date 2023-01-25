// @file debugflag.d
import std.stdio;

void main(){

	int myVariable = 5;

	debug{
		writeln("Logging: myVariable= ",myVariable);
	}

}
