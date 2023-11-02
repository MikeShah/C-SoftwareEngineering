// @file cov.d
// Run with: 
// (1) rdmd -cov -unittest cov.d
// or
// (2) rdmd -cov cov.d
// Observe the difference!
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
	if(true){
	function3();
	}else{
		import std.stdio;
		writeln("hi");
	}
}


void main(){

}
