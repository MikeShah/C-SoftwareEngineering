// @ file iterator.d
import std;

// An example data structure with an iterator
struct Iter(T){
    T[] data;
    
    // Sometimes folks wrap the iterator in an 'anonymous struct'
    // In a way this 'separates' it from the actual data structure.
    // I like that it also hides the fact that when you do copies
    // and such, that you don't need to copy 'currentPos'.
    // Maybe it depends on the
    struct{
        int currentPos=0;
				// Retrieve element
				// Note: The 'ref' part here is actually important
				//			 if we want to be able to modify the element we return.
				//  		 Of use is when we do a 'foreach(ref elem; collection)' for
				//       instance, we can actually modify the element.
				// 			 For folks writing libraries of containers this is useful!
        ref T front(){
            return data[currentPos];
        }
				// Forward Iterator
        void popFront(){
            currentPos++;
        }
				// Test if we're at the end of our iterator
        bool empty(){
            if(currentPos > data.length-1){
                return true;
            }
            return false;
        }
    }
}

void main()
{
    Iter!int myDataStructure;
    myDataStructure.data = [1,2,3,4];
    
    writeln("First foreach:");
    foreach(elem ; myDataStructure){
     	writeln(elem);   
        
        elem = 5; // Try to modify elements -- but 'elem' is just a copy
    }
    // Ensure that nothing was modified
    writeln("data after regular foreach: ",myDataStructure.data);
    
    // Try to iterate this time again, but by reference
    // thus modifying data structure.
    foreach(ref elem ; myDataStructure){
        elem = 5;
    }
    // Observe the data does change
    writeln("data after 'ref' foreach: ",myDataStructure.data);
    
    // Another iteration with 'ref' to again show data is changing.
    // I use this to show that the 'iterator' works.
    foreach(ref elem ; myDataStructure){
        elem = 0;
    }
   	// Observe the data does change
    // Observe that we can still use our 'iterator' again
		writeln("data after second 'ref' foreach: ",myDataStructure.data);
}
