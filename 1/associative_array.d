// @file associative_array.d
import std.stdio;

void main(){

	// Associative array
	// key = int
	// value = string
	string[int] students;

	students[12345] = "mike";
	writeln(students);	
	// The order can be confusing sometimes
	// here's an example for clarity where
	// I use 'alias' as another name.
	alias key 	= string;
	alias value = string;
	value[key] animals;

	// Insert a new key or update key if it exists
	animals["dog"] = "an animal that barks";
	animals["cat"] = "an animal that meows";

	writeln(animals);
}
