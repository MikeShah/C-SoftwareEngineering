// @file deepcopy.d
import std.stdio;        // writeln
import core.stdc.stdlib; // malloc for manual allocation

struct StructDeepCopy{
    int* memory;
    uint elements;

    // Perform an actual copy an allocate to
    // new memory
    this(const ref StructDeepCopy rhs){
        elements = rhs.elements;
        memory = cast(int*)malloc(int.sizeof * elements);
        // Now perform copy
        // (Note: Could use memcpy here for optimization)
        foreach(i ; 0 .. elements){
            memory[i] = rhs.memory[i];
        }

    }
}

void main(){
    /////////// Deep Copy ////////
    StructDeepCopy s1;
    s1.elements = 10;
    s1.memory   = cast(int*)malloc(int.sizeof * s1.elements);
    // Assign elements some even numbers
    foreach(i ; 0 .. s1.elements){
        s1.memory[i] = i*2;
    }
    // Do a deep copy.
    StructDeepCopy s2 = s1;
    s2.memory[0] = 7;
    // Observe that these elements are now different because
    // the copy allocated new memory for our object.
    writeln(s1.memory[0]);
    writeln(s2.memory[0]);

}
