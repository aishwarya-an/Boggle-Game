// This is the definition file of the Trie class

#include <iostream>
#include "Trie.h"

using namespace std;

// This is the constructor of the Trie class which constructs an empty trie.
Trie::Trie(){
	
}


// This is the copy constructor of the trie class which takes in an object of the trie class and creates another object by copying
// the contents from the first object.
Trie::Trie(const Trie &another){
	
}


// This is a private function which helps the copy constructor to copy the contents from one object into another. It takes
// a node and copies its contents into a newly created node and recursively calls itself with the nodes of the childlist
// of the current code taken as argument.
node* Trie::constructor_helper(const node* Node){
	return new node();
}



// This function takes in a string and returns whether the same is present in the trie or not in O(m) time where m is the length
// of the word.
bool Trie::find(string word){
	return true;
}



// This function takes in a string and inserts the same into the trie object. Its running time is O(m) where m is the length 
// of the word inserted.
void Trie::insert(string word){
	
}



// This is a private function used by the insert function. It takes in two words and returns the length of the prefix which
// is common in both words.
int Trie::get_common(string word1, string word2){
	return 0;
}


// This function returns the root of the trie.
const node* Trie::get_root() const{
	return new node();
}


// This function returns the number of words in the trie.
int Trie::get_size() const{
	return 0;
}


// This is the destructor which frees the memory dynamically allocated during the insertion of words into the trie.
Trie::~Trie(){
	
}


// This is a private function used by destructor of the class. It takes in a node and first recursively calls itself
// on the nodes of the childlist of the current node to free their memory and then frees the memory allocated for the current node.
void Trie::destructor_helper(node* Node){
	
}