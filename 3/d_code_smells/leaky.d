// @d_code_smells/leaky.d

// Simple Node class for a Singly Linked List
struct Node{
	Node* next = null;
	int   data = 0;
}


void main(){
	
	// Creating and setting up our nodes
	Node* n1 = new Node; 
	n1.data = 1;
  
	Node* n2 = new Node; 
	n2.data = 2;
	
	n1.next = n2;

	// This is sub-optimal -- we probably should not have
	// access to the raw loop -- we should write an iterator
	for(Node* start = n1; start != null; start = start.next){
		import std.stdio;
		writeln("node data: ", start.data);
	}
		
}


