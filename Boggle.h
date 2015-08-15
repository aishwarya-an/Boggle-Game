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
	vector<string> words;
	int points;
public:
	Boggle(int, int, string);
	Boggle(const Boggle&);
	void print_words();
	void run();
	void print_wrong_words(vector<string>*);
	const Trie* get_dictionary() const;
	const Board* get_board() const;
	const vector<string>* get_words() const;
	const Trie* get_words_trie() const;
	int get_points() const;
	~Boggle();
};

#endif