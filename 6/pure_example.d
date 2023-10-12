// @file pure_example.d
// rdmd -unittest pure_example.d

// global state 
int global=7;

pure unittest {
		int local = 5; // Local side-effect is fine.
		local = 5;
//	global = 5; // Uncomment the following
								// to observe the side effect
							  // that makes this test unpure
}

void main(){

}
