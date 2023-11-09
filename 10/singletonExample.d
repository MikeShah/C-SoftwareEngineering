// singletonExample.d
// rdmd singletonExample.d Singleton.d

import Singleton: Singleton;


void main(){
    import std.stdio;

//    Singleton g = new Singleton; // Not allowed to construct
    Singleton.instance().someValue = 5;
    Singleton.instance().someValue = 7;

    writeln(Singleton.instance().someValue);


}
