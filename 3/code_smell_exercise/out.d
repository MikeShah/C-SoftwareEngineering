// @code_smell_exercise/out.d

void generate_values(ref int out_param1, ref int out_param2){
	out_param1 = 1;
	out_param2 = 2;
}

void main(){
	import std.stdio;
	
	int i1,i2;

	generate_values(i1,i2);
	writeln(i1);	
	writeln(i2);	


}
