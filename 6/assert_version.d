// @file assert_version.d

// Find versions here: https://dlang.org/spec/version.html
// e.g. version(linux)
void someInitializationFunction(){
	version(Windows){
		writeln("running on windows");
	}else version(OSX){
		writeln("running on Mac OSX");
	}else{
		assert(0,"Unsupported operating system");
	}
}

void main(){
	someInitializationFunction();
}
