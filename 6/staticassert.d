// @file staticassert.d
import std.stdio;

auto squaref(float value)
{
	return value*value;
}

void main(){
	static assert( squaref(2.0f) == 4.0f);
	static assert( squaref(2.0f) == 7.0f); // Caught at compile-time!	
}
