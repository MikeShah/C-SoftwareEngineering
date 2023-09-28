// @file shallow.d
import std.stdio;        // writeln
import core.stdc.stdlib; // malloc for manual allocation

struct StructShallow{
    int* memory;
    uint elements;
}

void main(){
    /////////// Shallow Copy ////////
    StructShallow s1;
    s1.elements = 10;
    s1.memory   = cast(int*)malloc(int.sizeof * s1.elements);
    // Assign elements some even numbers
    foreach(i ; 0 .. s1.elements){
        s1.memory[i] = i*2;
    }
    // Do a shallow copy.
    StructShallow s2 = s1;
    s2.memory[0] = 7;
    // Observe the problem here that we made a change in 
    // s2 above, but s1 is effected
    writeln(s1.memory[0]);

}
