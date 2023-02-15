// @file fault.d
import std.stdio;

int square(int x){
    return x*x;
}

void main(){
    int input;

    // Inject a value that is 'faulty'
    input = 'a';
    
    // test our programs behavior
    writeln(square(input));
}
