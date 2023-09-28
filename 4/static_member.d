// @file static_member.d
import std.stdio;

struct StructType{
    int mData;
    static uint mSharedValue;
}


void main(){
    // Access the 'static' member variable through
    // the type
    StructType.mSharedValue = 9999;

    // This new instance of 'StructType' shares
    // the member variable
    StructType s;
    writeln(s.mSharedValue);

    s.mSharedValue = 757;
    writeln(StructType.mSharedValue);

}
