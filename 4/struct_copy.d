// @file struct_copy.d
import std.stdio;

struct StructType{
    int mData1;
    int mData2;

    // Constructor
    this(int _mData1, int _mData2){
        mData1 = _mData1;
        mData2 = _mData2;
    }

    // Destructor
    ~this(){
        writeln("Goodbye!");
    }

    // Copy Constructor
    // Takes in first parameter as 
    // the type we are making a copy of
    // Note: (Other parameters can follow)
    // Note: If we do not provide a copy
    //       constructor, the compiler will
    //       make one for us.
    this(const ref StructType rhs){
        writeln("copy being made!");
        mData1 = rhs.mData1;
        mData2 = rhs.mData2;
    }
    //this(ref StructType rhs){}
    this(ref return scope StructType rhs){
    }
}

void main(){

    // Struct literal
    StructType s = StructType(15,7);
    writeln(s.mData1);
    writeln(s.mData2);

    StructType s1 = s;
    writeln(s1.mData1);
    writeln(s1.mData2);
}
