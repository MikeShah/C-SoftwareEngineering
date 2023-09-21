// @file programanalysis/dynamic_analysis.d
// See file 'output.log' created when terminated
import std.logger;
import std.stdio;
import std.conv;
import std.string;

void Hello(){
	writeln("Hello, this should take some time");
}

void main(){

	auto logger = new FileLogger("output.log");

	int x;
	logger.log("x is:",x);

	Hello();
}

