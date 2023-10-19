// @file gameloop/main_c.d
//

import std.stdio;

void input(){
	writeln("void input()");
}

void update(){
	writeln("void update()");
}

void render(){
	writeln("void render)");
}

void main(){

	// Pointers to specific functions
	// that can be changed at run-time

	pfn_input  = &input;
	pfn_update = &update;
	pfn_render = &render;

		while(true){
				pfn_input();
				pfn_update();
				pfn_render();
		}
}


