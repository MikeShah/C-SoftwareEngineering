// @file dynamic_analysis.d
// See file 'output.log' created when terminated
import std.logger;
import std.stdio;
import std.conv;
import std.string;

void main(){

	auto logger = new FileLogger("output.log");

	int x;
	while(true){
		x = readln().chop.to!int;

		logger.log(x);
	
	}

}

