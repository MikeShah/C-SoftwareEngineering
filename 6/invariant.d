// @file invariant.d
// rdmd -unittest -main invariant.d
struct PositiveValues{
	float x,y;

	void Add(float _x, float _y){
		x += _x;
		y += _y;
	}

	void Subtract(float _x, float _y){
		x -= _x;
		y -= _y;
	}

	// invariant checked before constructor, after destructor,
	// and before & after every member function call.
	// Ideally we would check the 'state' of our object
	// meaning each member variable.
	invariant(){
		assert(x>=0, "x < 0");
		assert(y>=0, "y < 0");
	}
}

unittest{
	// No need for individual asserts, just use the 
	// object like normal.
 	PositiveValues p;
	p.Add(2,3);
	p.Subtract(5,9);
}


