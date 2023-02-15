// @file assertion2.d
import std.stdio;
import core.stdc.stdio;

void PrintData(int[] data, int size) nothrow {
	assert(size > 0, "HEY! size must be greater than 0");

	for(size_t i=0; i < size; i++){
		printf("%i,",data[i]);
	}
	printf("\n");
}

void main(){

	auto data = [1,2,3,4];

	PrintData(data, 4);
	
}
