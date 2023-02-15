// @file nothrow.d

// Note: For templated code the compiler infers automatically
//       if a function is nothrow or not
void functionNoThrow() nothrow{
// 	UnSafeCode();  // this is NOT allowed.
				   // This function can throw an
				   // exception.
}

void UnSafeCode(){
	try{

	}catch(Exception e){

	}finally{

	}
}

void main(){
	functionNoThrow();
}

