// @file printdebug3.d
import std.stdio;
import core.stdc.stdlib; // for 'exit' function

int square(int a){
	return a;
}

void main(){
	
	while(true){
		writeln("output 1:",square(5));
		if(square(5)==25){
			writeln("output 2:",square(5));
			exit(1);
		}
		writeln("output 3:",square(5));
	}

	writeln("Exiting program");
}

