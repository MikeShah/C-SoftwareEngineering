// @file debug.d
import std.stdio;

auto squaref(float value)
{
	return value*value;
}

void main(){
	float four = squaref(2.0f);
	debug{
		writeln("The value of variable four is: ",four);
		assert(four==4.0f);
	}
}
