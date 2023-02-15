// @file cov.d
// Run with: 
import std.stdio;

int* function1(){
	int* pointer;
	return pointer;
}

int* function2(){
	int* pointer;
	return pointer;
}
int* function3(){
	int* pointer;
	return pointer;
}

// unittest
unittest{
	function3();
}


void main(){

}
