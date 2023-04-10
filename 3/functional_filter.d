// @ file functional_filter.d
import std.stdio;
import std.algorithm;   // map
import std.string;

void main(){

	// Loop style
	// A little better with foreach loop
	auto words = ["hello", "world", "dlang", "c++", "java"];
	int coolLanguages = 0;
	foreach(element ; words){
		if(element=="dlang"){
			coolLanguages++;
		}
	}
	writeln("Cool languages found: ",coolLanguages);

	// Functional-style

	auto words2 = ["hello", "world", "dlang", "c++", "java"];
	auto result = words.filter!(a=> a.indexOf("dlang") >=0).count;
	writeln("Cool languages found: ",result);

}
