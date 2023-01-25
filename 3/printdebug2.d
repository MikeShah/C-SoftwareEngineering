// @file printdebug2.d
import std.stdio;
import core.stdc.stdlib; // for 'exit' function

int square(int a){
	return a;
}

void main(){
	
	while(true){
		if(square(5)==25){
			exit(1);
		}
	}

	writeln("Exiting program");
}
