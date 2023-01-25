// @file version.d
import std.stdio;

void main(){

	version(M1MAC){
		writeln("You are running on M1 Mac");
	}else{
		writeln("You are using some other machine");
	}

}
