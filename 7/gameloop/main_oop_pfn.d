// @file gameloop/main_oop_pfn.d
import std.stdio;

// Easily call function pointer as paramter
alias voidFunc = void function();

void input(){ 	writeln("void input()"); }

void update(){ 	writeln("void update()");}

void render(){	writeln("void render)"); }


struct Applictaion{

		void setInputFunction(voidFunc fun){
				pfn_input = fun;
		}
		void setUpdateFunction(voidFunc fun){
				pfn_update = fun;
		}
		void setRenderFunction(voidFunc fun){
				pfn_render = fun;
		}

		this(bool running){
				mRun = running;
		}
		void loop(){
				while(mRun){
						pfn_input();
						pfn_update();
						pfn_render();
				}
		}

		bool mRun;
		void function() pfn_input;
		void function() pfn_update;
		void function() pfn_render;
}

void main(){

		Applictaion app = Applictaion(false);
		app.setInputFunction(&input);
		app.setUpdateFunction(&update);
		app.setRenderFunction(&render);

		app.mRun = true;
		app.loop();
}


