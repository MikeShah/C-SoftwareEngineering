// @file staticassert.d
import std.stdio;

auto squaref(float value)
{
	return value*value;
}

struct Packet{
	int x,y,z;
}

void main(){
	writeln("This will not print, if we get a compile-time assert failure");

	static assert( squaref(2.0f) == 4.0f);
//	static assert( squaref(2.0f) == 7.0f); // Caught at compile-time!	

	// A more pragmatic example checking the
	// integrity of our data structure size.
	static assert( Packet.sizeof == 8,"Packet is not the expected # of bytes");
}







