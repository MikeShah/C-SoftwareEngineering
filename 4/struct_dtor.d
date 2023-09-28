// @file struct_dtor.d
import std.stdio;

struct StructType{
    int mData1;
    int mData2;

    this(int _mData1){
        mData1 = _mData1;
        mData2 = 200;
    }
    this(int _mData1, int _mData2){
        mData1 = _mData1;
        mData2 = 200;
    }

    // Destructor
    ~this(){
        writeln("Goodbye!");
    }
}

void main(){

    // Struct literal
    StructType s = StructType();
    writeln(s.mData1);
    writeln(s.mData2);

    StructType s1 = StructType(7);
    writeln(s1.mData1);
    writeln(s1.mData2);
}
