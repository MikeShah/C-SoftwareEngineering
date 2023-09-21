// @code_smell_exercise/out_fix2.d
import std.typecons;

Tuple!(int,int) generate_values(){
	Tuple!(int,int) result;
	result[0] = 1;
	result[1] = 2;
	return result;
}

void main(){
	import std.stdio;
	
	const auto values = generate_values();
	writeln(values[0]);	
	writeln(values[1]);	
}
