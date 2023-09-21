// @file programanalysis/unusedVariable.d
// Run and observe report:
// dub run dscanner -- --report unusedVariable.d
import std.stdio;

void main(){
	import std.stdio;

	int x;
	int y;
	writeln("y is:",y);

}
