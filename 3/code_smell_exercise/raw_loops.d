// @code_smell_exercise/raw_loops.d

bool DataIsValid(int[] input){
	for(int i=0; i < input.length; i++){
		if(input[i] < 100 && input[i] > -100){
			return true;
		}
	}
	return false;
}

void main(){
	import std.stdio;
	import std.algorithm;

	auto someData = [-5,4,2,-9,2,77];
	writeln(DataIsValid(someData));
	
}
