// @file functioncontract.d
import std.stdio;

auto squaref(float value)
		in{
			assert(value >=0);
		}
		out (result){
			assert(result >=0);
		}
do
{
	return value*value;
}

void main(){
	writeln(squaref(0.0f)); // OKAY
	writeln(squaref(1.0f)); // OKAY
	writeln(squaref(-1.0f)); // WRONG 
	
}
