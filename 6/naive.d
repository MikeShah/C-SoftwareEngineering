// @file naive.d
import std.stdio;

int square(int x){
	return x*x;
}

void main(){
	int four = square(2);
	writeln("square(2) =", square(2));

}
