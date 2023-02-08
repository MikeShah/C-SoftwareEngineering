// @file semantics.d
import std.stdio;

struct StructType{
    int mData;
}

class ClassType{
    int mData;
}

void StructByValueDefault(StructType _s){
    _s.mData = 9999;
}

void ClassByReferenceDefault(ClassType _c){
    _c.mData = 9999;
}


void main(){
    // Struct is a Value Type
    StructType s;
    StructByValueDefault(s);
    writeln(s.mData);

    // Class is a Reference Type
    ClassType c = new ClassType;
    ClassByReferenceDefault(c);
    writeln(c.mData);

}
