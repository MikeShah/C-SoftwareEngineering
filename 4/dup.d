// @file dup.d
// Example file for performing a deep copy

class C{
    ulong[] data;

    // Constructor for the class
    this(ulong size){
        import std.range;
        import std.array;

        data.length = size;
        data = iota(0,size,1).array;

    }

    // Perform the deep copy
    // 'dup' short for duplicate performs the deep copy
    // we return a new object.
    C dup(){
        // First make a new memory allocation for our class object.
        C copy = new C(data.length);
        // The underlying data must also be duplicated
        // In this case, built-in dynamic arrays have a 'dup' function
        // that can do the deep copy
        copy.data = this.data.dup;

        // Return the new object.
        return copy;
    }

    // Print out the data
    void print(){
        import std.stdio;
        writeln(this.data);
    }
}

void main(){
    // Create a 'first object'
    C firstObject = new C(5);
    // Create a 'second object' that is a duplicate of
    // the first.
    C newObject = firstObject.dup;
    
    // Change some data in the first object
    firstObject.data[0] = 99999;
    // Observe that only the first object
    // is modified, thus indicating 'integrs' and 'newObject'
    // indeed occupy different collections of memory
    firstObject.print();
    newObject.print();
}
