// @file gameloop/main_oop.d
import std.stdio;

struct Applictaion{
		void input(){
			writeln("void input()");
		}

		void update(){
			writeln("void update()");
		}

		void render(){
			writeln("void render)");
		}

		void loop(){
				while(true){
						input();
						update();
						render();
				}
		}
}

void main(){

		Applictaion app;

		app.loop();

}


