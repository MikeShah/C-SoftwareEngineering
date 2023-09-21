// @code_smell_exercise/raw_loops.d

void main(){
	import std.stdio;
	import std.algorithm;

	auto someData = [-5,4,2,-9,2,77];
	all!"a > -100 && a < 100"(someData).writeln();
	
}
