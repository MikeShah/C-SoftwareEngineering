// struct_template.d
// Run with args "-vcg-ast" to see what is generated
// This will generate struct_template.d.cg

struct DataStructure(T){
    T[] data;
}

void main(){
    import std.stdio;
    
    DataStructure!int ds;

    ds.data = [1,2,3,4,5,6];

    writeln(ds.data);
}
