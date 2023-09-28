// @file operator_overload.d
import std.stdio;

struct StructType{
    int mData1;
    int mData2;

    this(const ref StructType rhs){
        writeln("copy being made!");
        mData1 = rhs.mData1;
        mData2 = rhs.mData2;
    }
	// =
    void opAssign(StructType rhs){
        writeln("Assignment");
        mData1 = rhs.mData1;
        mData2 = rhs.mData2;
    }
	// ==
    bool opEquals(StructType rhs){
        writeln("Equality Test");
        return (mData1 == rhs.mData1 &&
                mData2 == rhs.mData2);
    }
}

void main(){

    // Struct literal
    StructType s = StructType(15,7);

    // Create second struct 
    StructType s1;

    // Call opAssign
    s1 = s;
    writeln(s1.mData1);
    writeln(s1.mData2);

    // call opEqual
    if(s1 == s){
        writeln("s1 == s");
    }

}
