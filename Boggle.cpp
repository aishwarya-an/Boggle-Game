// This is the definition of the Boggle class

#include <fstream>
#include <algorithm>
#include <cctype>
#include "Boggle.h"

using namespace std;

// This is the constructor which takes in the number of rows and columns and the name of the file containing the dictionary.
// It creates a board with the number of rows and columns given. It inserts all the words from the file(dictionary) to the trie. 
Boggle::Boggle(int row, int column, string filename){
	grid = new Board(row, column);
	dictionary = new Trie();
	ifstream file;
	file.open(filename.c_str());
	string word;
	while(file >> word){
		word = to_uppercase(word);
		dictionary->insert(word);
	}
	possible_words = new Trie();
	words = new vector<string>();
	visited = new vector<bool>(row * column, false);
	points = 0;
	find_words();
	// Sorting all the words in alphabetical order
	sort(words->begin(), words->end());
}


// This is the copy constructor which takes in an object and copies the contents of the object into another new object.
Boggle::Boggle(const Boggle &another){
	const Board* board2 = another.get_board();
	const Trie* dictionary2 = another.get_dictionary();
	grid = new Board(*board2);
	dictionary = new Trie(*dictionary2);
	possible_words = new Trie(*another.get_words_trie());
	words = new vector<string>(*another.get_words());
}


// This function is called by the constructor and finds all the possible words which can be formed from the letters of the board.
void Boggle::find_words(){
	const vector<string>* board = grid->get_board();
	const node* Root = dictionary->get_root();
	int i = 0;
	while(i < board->size()){
		Depth_First_Search(board, i, Root, false, 0, (*board)[i], "");
		++i;
	}
}


// This is a private function called by the find_words() function. It takes in the board, the current letter index, the current 
// node in the dictionary trie, the bool value whether all the letters in the current node are checked, the position of the
// label of the current node to be checked, the current letter in the board which is to be added to the word so far obtained
// and the string which is the word so far obtained. 
// This function follows the rule : when the current path corresponds to a string that is not a prefix of any word in the 
// dictionary, there is no need to expand the path further.
// So, if the word so far formed along with the current letter is not a prefix to any word, then it does not continue adding
// letters to the current path of the word formed.
// Else, if the word so formed along with the current letter is a prefix of some word, then it recursively calls the function
// with the word so far formed to be the previous one + the current letter and the letter to be checked will be adjacent
// letters of the current letter, where the adjacent letters are the left, right, up, down, diagonal left up, diagonal right up,
// diagonal left down and diagonal right down letter to the current letter

void Boggle::Depth_First_Search(const vector<string>* board, int letter_index, const node* current_node, bool is_done, int index, string letter, string word){
	(*visited)[letter_index] = true;
	// Makes the visited value of the current letter to true so that the same die is not repeated in a word.
	int rows = grid->get_rows();
	int columns = grid->get_columns();
	// Finds whether the current node has some remaining positions to be checked or the letter to be checked has to be found
	// in the childlist of the current node.

	// If the letter has to be found in the childlist
	if(!is_done){
		int i = 0;
		// If it does not have a childlist
		if(current_node->is_leaf){
			(*visited)[letter_index] = false;
			return;
		}
		vector<node*>* children = current_node->childlist;
		while(i < children->size()){
			string current = (*children)[i]->label;
			// If the letter to be checked is a single letter and not "Qu"
			if(letter.size() == 1){
				if(current[0] == letter[0]){
					if(current.size() == 1 && (*children)[i]->is_word && (word+letter).size() >= 3){
						possible_words->insert(word + letter);
						words->insert(words->begin(), word + letter);
						points += points_for_word(word + letter);
					}
					current_node = (*children)[i];
					index = 0;
					break;
				}
			}

			// Else if the letter to be checked is "Qu"
			else if(letter.size() == 2){
				if(current[0] == letter[0]){
					if(current.size() != 1){
						if(current[1] != 'U'){
							(*visited)[letter_index] = false;
							return;
						}
						else if(current.size() == 2 && (*children)[i]->is_word && (word + letter).size() >= 3){
							possible_words->insert(word + letter);
							words->insert(words->begin(), word + letter);
							points += points_for_word(word + letter);
						}
					}
					// Else if the size of the label of current node is 1, then check 'u' separately in the childlist of current node
					else
						Depth_First_Search(board, letter_index, (*children)[i], false, index, "U", word + 'Q');
				}
			}
			++i;
		}
		// If the letter is not found in the childlist.
		if(i == children->size()){
			(*visited)[letter_index] = false;
			return;
		}
	}

	// Else if there are letters in the current node which are not yet compared with, then compare the indexth position
	// of the current node with the letter to be checked.
	else{
		if(letter.size() == 1){
			if((*current_node).label[index] == letter[0]){
				if(index == current_node->label.size() - 1 && current_node->is_word && (word + letter).size() >= 3){
					possible_words->insert(word + letter);
					words->insert(words->begin(), word + letter);
					points += points_for_word(word + letter);
				}
			}
			else{
				(*visited)[letter_index] = false;
				return;
			}
		}
		else if(letter.size() == 2){
			if((*current_node).label[index] == letter[0]){
				if(index != current_node->label.size() -1){
					if((*current_node).label[++index] == 'U'){
						if(index == current_node->label.size() - 1 && current_node->is_word && (word + letter).size() >= 3){
							possible_words->insert(word + letter);
							words->insert(words->begin(), word + letter);
							points += points_for_word(word + letter);
						}
					}
					else{
						(*visited)[letter_index] = false;
						return;
					}
				}
				// Else if it is the ned of current node, then check for 'u' in the childlist of current node
				else
					Depth_First_Search(board, letter_index, current_node, false, index, "U", word + 'Q');
			}
			else{
				(*visited)[letter_index] = false;
				return;
			}
		}
	}

	int left, right, up, down, diagonal_up_left, diagonal_up_right, diagonal_down_left, diagonal_down_right;
	// The above are names of the adjacent letters of the current letter accordingly
	left = letter_index - 1;
	right = letter_index + 1;
	up = letter_index - columns;
	down = letter_index + columns;
	diagonal_up_left = up - 1;
	diagonal_down_left = down - 1;
	diagonal_up_right = up + 1;
	diagonal_down_right = down + 1;

	// If the current letter in the leftmost boundary
	if(letter_index % columns == 0){
		left = -1;
		diagonal_up_left = -1;
		diagonal_down_left = -1;
	}
	// If the current letter is in the rightmost boundary
	if((letter_index + 1) % columns == 0){
		right = -1;
		diagonal_up_right = -1;
		diagonal_down_right = -1;
	}
	bool value = true;
	// This bool value will store whether to check the next letter in the current node or to check it in the childlist
	// of the current node
	if(index == current_node->label.size() - 1)
		value = false;

	// Calling the function recursively on the adjacent letters of the current letters
	if(left >= 0 && !(*visited)[left])
		Depth_First_Search(board, left, current_node, value, index + 1, (*board)[left], word + letter);
	if(right >= 0 && right < (rows * columns) && !(*visited)[right])
		Depth_First_Search(board, right, current_node, value, index + 1, (*board)[right], word + letter);
	if(up >= 0 && !(*visited)[up])
		Depth_First_Search(board, up, current_node, value, index + 1, (*board)[up], word + letter);
	if(down < (rows * columns) && !(*visited)[down])
		Depth_First_Search(board, down, current_node, value, index + 1, (*board)[down], word + letter);
	if(diagonal_up_left >= 0 && !(*visited)[diagonal_up_left])
		Depth_First_Search(board, diagonal_up_left, current_node, value, index + 1, (*board)[diagonal_up_left], word + letter);
	if(diagonal_up_right >= 0 && !(*visited)[diagonal_up_right])
		Depth_First_Search(board, diagonal_up_right, current_node, value, index + 1, (*board)[diagonal_up_right], word + letter);
	if(diagonal_down_left >= 0 && diagonal_down_left < (rows * columns) && !(*visited)[diagonal_down_left])
		Depth_First_Search(board, diagonal_down_left, current_node, value, index + 1, (*board)[diagonal_down_left], word + letter);
	if(diagonal_down_right >= 0 && diagonal_down_right < (rows * columns) && !(*visited)[diagonal_down_right])
		Depth_First_Search(board, diagonal_down_right, current_node, value, index + 1, (*board)[diagonal_down_right], word + letter);
	(*visited)[letter_index] = false;
	// Making the visited value of the current letter to false, since the word forming from the current letter ot using the current
	// letter is done.
}


// This function prints all the possible words using the letters in the board.
void Boggle::print_words(){
	cout << "The possible words which can be formed from the board are : " << endl;
	int i = 0;
	while(i < words->size()){
		cout << (*words)[i] << endl;
		++i;
	}
}


// This private function is used to convert the word taken in to its uppercase form.
string Boggle::to_uppercase(string word){
	int i = 0;
	while(i < word.size()){
		word[i] = toupper(word[i]);
		++i;
	}
	return word;
}


// This private function returns the points for the word taken in according to its length.
int Boggle::points_for_word(string word){
	if(word.size() < 3)
		return 0;
	if(word.size() == 3 || word.size() == 4)
		return 1;
	if(word.size() == 5)
		return 2;
	if(word.size() == 6)
		return 3;
	if(word.size() == 7)
		return 5;
	if(word.size() >= 8)
		return 11;
}

// This function first prints the board consisting of the letters, then takes the input of words from the user. It then prints
// the words of the user which are wrong. It also prints all the possible words using the letters in the board and gives the 
// points scored by the user and the total points which could have been scored by the user i.e the points for all the possible
// words.
void Boggle::run(){
	cout << "The boggle board is : " << endl;
	grid->print();
	cout << endl << "Give all the valid words which can be formed using the letters in the above board according to the following"
	<< " rules : " << endl << "1. A valid word must be composed by following a sequence of adjacent dice — two dice are adjacent" 
	<< " if they are horizontal, vertical, or diagonal neighbours." << endl << "2. A valid word can use each die at most once."
	<< endl << "3. A valid word must contain at least 3 letters." << endl << "4. A valid word must be in the dictionary (which" 
	<< " typically does not contain proper nouns)." << endl << "Points will be given according to the length of the words you form."
	<< endl << "Press Q when you finish inputing words.." << endl << endl;
	vector<string> wrong_words;
	int current_points = 0;
	string word;
	cin >> word;
	while(word != "Q"){
		word = to_uppercase(word);
		if(word.size() < 3 || !possible_words->find(word))
			wrong_words.insert(wrong_words.begin(), word);
		else
			current_points += points_for_word(word);
		cin >> word;
	}
	cout << endl;
	print_wrong_words(&wrong_words);
	cout << endl;
	print_words();
	cout << endl << "Points scored by you : " << current_points << endl << "Total points which could have been scored : " << points
	<< endl;
}


// This function takes in a vector of words, which are wrong words and prints them. This function is called by the run() function.
void Boggle::print_wrong_words(vector<string>* wrong_words){
	cout << "The wrong words given by you : " << endl;
	int i = 0;
	while(i < wrong_words->size()){
		cout << (*wrong_words)[i] << endl;
		++i;
	}
}


// This function returns the trie containing the dictionary.
const Trie* Boggle::get_dictionary() const{
	return dictionary;
}

// This function returns board which contains the letters in a random form.
const Board* Boggle::get_board() const{
	return grid;
}

// This function returns the vector containing all the possible words which can be formed using the letters in the board.
const vector<string>* Boggle::get_words() const{
	return words;
}

// This function returns the trie containing the possible words which can be formed using the letters in the board.
const Trie* Boggle::get_words_trie() const{
	return possible_words;
}

// This function returns the total points for all the possible words obtained using the letters in the board. The points is stored
// in a private member. 
int Boggle::get_points() const{
	return points;
}

// This is the destructor which frees the memory dynamically allocated by the constructor.
Boggle::~Boggle(){
	delete grid;
	delete dictionary;
}