// @file chaining.d
import std.stdio;
import std.string;

void main(){

	string sentence = " mike was here ";

	// Read this left-to right
	writeln(sentence.strip.toUpper.replace("MIKE","joe").strip);

	// Apply operations top to bottom
	writeln(sentence.
					strip.
					toUpper.
					replace("MIKE","joe").
					strip
			);
}

