// @file struct_and_class.d
import std.stdio;

struct StructType{
    int mData;
}

class ClassType{
    int mData;
}

void main(){
    // Struct is a Value Type
    StructType s;
    writeln(s.mData);

    // Class is a Reference Type
    ClassType c = new ClassType;
    writeln(c.mData);

}
