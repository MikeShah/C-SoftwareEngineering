// @file unit_test_function.d
import std.stdio;
import core.stdc.stdlib; // for enum EXIT_FAILURE 

int square(int x){
	return (x*x) + 1; // Inserted '+1' for demo purpose
					  // to show a failure
}

// pre-condition : Input is 2
// post-condition: Output is 4
// Result: True if output is 4, otherwise false 
bool square_test(){
	if(square(2)!=4){
		writeln("square(2) != 4: square(2)=",square(2));
		return false;
	}
	return true;
}

void main(){
	int four = square(2);

	if(!square_test){
		exit(EXIT_FAILURE);
	}

}
