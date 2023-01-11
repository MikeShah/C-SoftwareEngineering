#include <iostream>
#include <string>

// A special generic data type
template <class T>
class Node{
public:
	T data;
	Node* next;

	Node(T _data): data(_data){
	}

};

// This linked list holds integers
class LinkedList{
public:
	Node<int>* head;

	// Constructor
	LinkedList(){
		head = nullptr;
	}	

	// Add prepend node
	void addNode(Node<int>* node){
		if(head==nullptr){
			head = node;
			head->next = nullptr;
		}else{
			node->next = head;
			head = node;
		}
	}

	// Create a temporary iterator
	void iterate(){
		Node<int>* iter = head;
		while(iter!= nullptr){
			std::cout << iter->data << " ";
			iter=iter->next;	
		}
		std::cout << std::endl;
	}

};	 


int main(){

	LinkedList l;
	
	l.addNode(new Node<int>(0));
	l.addNode(new Node<int>(1));
	l.addNode(new Node<int>(2));
	l.addNode(new Node<int>(3));
	l.addNode(new Node<int>(4));

	l.iterate();

	return 0;
}
