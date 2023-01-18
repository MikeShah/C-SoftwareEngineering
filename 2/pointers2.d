// @file pointers2.d

import std.stdio;

void main(){
    int   x = 7;
    auto px = &x;
    
    writeln(x);
    writeln(*px); 
    writeln(typeid(px));
}
