// @file gdc_example.d
import std.stdio;
import std.conv;
import std.string;

void main(){
	string input;
	input = readln();

	int x = to!int(input.chop);

	writeln("10 divided by x = ", 10/x);
}
