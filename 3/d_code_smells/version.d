// @d_code_smells/version.d 

void main(){
	import std.stdio;

	version(linux){
		writeln("Running on linux");
	}else if(Windows){
		writeln("Running on Windows");
	}else if(OSX){
		writeln("Running on OSX");
	}else{
		// This is the important line here,
		// effectively we want to crash if we 
		// do not have a supported feature.
		// In D we use the 'version' keyword 
		// versus the preprocessor in other languages.
		// https://dlang.org/spec/version.html#version	
		assert(0,"Unsupported platform");
	}

}
