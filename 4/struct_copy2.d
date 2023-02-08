// @file struct_copy2.d
import std.stdio;

struct StructType{
    int mData1;
    int mData2;

    this(const ref StructType rhs){
        writeln("copy being made!");
        mData1 = rhs.mData1;
        mData2 = rhs.mData2;
    }
}

// (2) Copy constructor called when passed
//   -- i.e. new copy constructed
void func(StructType s){
    
}

void main(){

    // Struct literal
    StructType s = StructType(15,7);

    // (1) Copy made during construction
    StructType s1 = s;
    StructType s2;

    // Pass-by-Value 
    func(s);

    // This is not a copy construtor, but 
    // copy-assignment
    s2 = s;
}
