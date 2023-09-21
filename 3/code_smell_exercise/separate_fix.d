// @code_smell_exercise/separte.d

void main(){
	import std.stdio;
	// immutable infers type 'string'
	// 'string' is immutable(immutable(char)[])
	// as it is anyway in D.
	immutable value = "something";
	
	writeln(value);
	writeln(typeid(value));
}
