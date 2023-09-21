// @d_code_smells/not_leaky.d

// Simple Node class for a Singly Linked List
struct Node{
	private Node* next = null;
	private int   data = 0;

	void SetData(int data){
		this.data = data;
	}
	int GetData() const{
		return this.data;
	}
	void SetNext(ref Node* next){
		// Add some protection, could handle as an exception as well.
		assert(this.next !is next, "cannot assign this.next to next");	
		this.next = next;
	}
}
// Abstract the idea of iterating from the 'Node' data structure
struct SinglyLinkedListRange{
	private Node* n;
	
	this(Node* n){
		this.n = n;
	}
	Node* front(){ return n; }
	void popFront() { n = n.next; }
	bool empty() { return n==null; }	
}

void main(){
	
	// Creating and setting up our nodes
	Node* n1 = new Node; 
	n1.SetData(1);
  
	Node* n2 = new Node; 
	n2.SetData(2);
	
	n1.SetNext(n2);

	// Much better, avoiding direct access to pointers
	foreach(someNode; SinglyLinkedListRange(n1)){
		import std.stdio;
		writeln(someNode.GetData());
	}
		
}


