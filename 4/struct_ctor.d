// @file struct_ctor.d
import std.stdio;

struct StructType{
    int mData1;
    int mData2;

//    this(){
//        mData1 = 100;
//        mData2 = 200;
//    }
    this(int _mData1){
        mData1 = _mData1;
        mData2 = 200;
    }
    this(int _mData1, int _mData2){
        mData1 = _mData1;
        mData2 = 200;
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

    StructType s2 = StructType(9,45);
    writeln(s2.mData1);
    writeln(s2.mData2);

    // Named initializer with 1 or more
    // member variables
//    StructType s3 = {mData2:46};
//    writeln(s3.mData1);
//    writeln(s3.mData2);
}
