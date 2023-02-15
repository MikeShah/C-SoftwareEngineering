// @file invariant2.d
// rdmd -unittest -main invariant2.d
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

	invariant(){
		assert(x>=0, "x < 0");
		assert(y>=0, "y < 0");
	}
}

// Write a unit test documenting the actual things
// a user might want to do
unittest{
	float offset = 1.0f;
 	PositiveValues p = {x:offset, y:offset};


	import std.math;
	for(float i=0; i < 360; i++){
		p.Add(cos(i),sin(i));
	}
}


