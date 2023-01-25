// @ file gdb.d
// dmd -g -gf gdb.d -of=prog
// or
// ldc2 -g -gc gdb.d -of=prog
import std.stdio;

struct SomeObject
{
    int field1;
    int field2;
}

void otherhelper(){

    int* p = null;
    *p = 10;
}

void helper(){
    otherhelper();

    int* x= null;
    int* p=x;

    *p = 42;
}

void main(string[] args){

    SomeObject o1;
    o1.field1 = 7;
    o1.field2 = 9;

    int[] numbers;

    for(int i=0; i < 10; i++){
        numbers  ~= i;
    }

	foreach(element; numbers){
		writeln(element);
	}

    helper();

    int counter =0;
    while(1){
        writeln("running ", counter," times\n");
        counter++;
    }

}
