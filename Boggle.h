// This is the declaration of the Boggle class

#include <iostream>
#include "Trie.h"
#include "Board.h"

using namespace std;

#ifndef BOGGLE_H
#define BOGGLE_H

class Boggle{
private:
	Trie* dictionary;
	Board* grid;
	Trie* possible_words;
	vector<string>* words;
	vector<bool>* visited;
	int points;
	void Depth_First_Search(const vector<string>*, int, const node*, bool, int, string, string);
	string to_uppercase(string);
	int points_for_word(string);
public:
	Boggle(int, int, string);
	Boggle(const Boggle&);
	void find_words();
	void print_words();
	void run();
	vector<string>* run(vector<string>*);
	void print_wrong_words(vector<string>*);
	void print_board();
	const Trie* get_dictionary() const;
	const Board* get_board() const;
	const vector<string>* get_words() const;
	const Trie* get_words_trie() const;
	int get_points() const;
	~Boggle();
};

#endif