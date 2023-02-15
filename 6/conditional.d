// @file conditional.d
import std.stdio;
import core.stdc.stdlib; // for enum EXIT_FAILURE 

int square(int x){
	return (x*x) + 1; // Inserted '+1' for demo purpose
					  // to show a failure
}

void main(){
	int four = square(2);

	if(square(2)!=4){
		writeln("square(2) != 4: square(2)=",square(2));
		exit(EXIT_FAILURE);
	}
}
