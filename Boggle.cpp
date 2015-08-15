// This is the definition of the Boggle class

#include "Boggle.h"

using namespace std;

// This is the constructor which takes in the number of rows and columns and the name of the file containing the dictionary.
Boggle::Boggle(int row, int column, string filename){

}

// This is the copy constructor which takes in an object and copies the contents of the object into another new object.
Boggle::Boggle(const Boggle &another){

}

// This function prints all the possible words using the latters in the board.
void Boggle::print_words(){

}

// This function first prints the board consisting of the letters, then takes the input of words from the user. It then prints
// the words of the user which are wrong. It also prints all the possible words using the letters in the board and gives the 
// points scored by the user and the total points which could have been scored by the user i.e the points for all the possible
// words.
void Boggle::run(){

}

// This function takes in a vector of words, which are wrong words and prints them. This function is called by the run() function.
void Boggle::print_wrong_words(vector<string>* wrong_words){

}

// This function returns the trie containing the dictionary.
const Trie* Boggle::get_dictionary() const{
	return new Trie();
}

// This function returns board which contains the letters in a random form.
const Board* Boggle::get_board() const{
	return new Board(0, 0);
}

// This function returns the vector containing all the possible words which can be formed using the letters in the board.
const vector<string>* Boggle::get_words() const{
	return new vector<string>();
}

// This function returns the trie containing the possible words which can be formed using the letters in the board.
const Trie* Boggle::get_words_trie() const{
	return new Trie();
}

// This function returns the total points for all the possible words obtained using the letters in the board. The points is stored
// in a private member. 
int Boggle::get_points() const{
	return 0;
}

// This is the destructor which frees the memory dynamically allocated by the constructor.
Boggle::~Boggle(){

}