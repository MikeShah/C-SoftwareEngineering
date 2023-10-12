// @file enforce_example.d
//
// NOTE: As a fun bug while writing this, I named
// 		 	 the module 'enforce' originally which gave
//       me a weird error. So avoid naming your .d
//       files or module names as keywords or funtion names 
//       in the libraries you are using :)
module enforce_example;

void main(){
		import std.stdio;
		import std.exception;

		int students = 29;
	
		try{
			if(students < 30){
					throw new Exception("Student < 30 !");
			}
		}catch(Exception e){
			writeln("msg : ",e.msg);
			writeln("file: ",e.file);
			writeln("line: ",e.line);
		}

		try{
			enforce(students >=30, "Must have 30 or more students...");
		}catch(Exception e){
			writeln("msg : ",e.msg);
			writeln("file: ",e.file);
			writeln("line: ",e.line);
		}
}
