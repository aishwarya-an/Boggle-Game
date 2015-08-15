// This is the declaration of the Board class

#include <iostream>
#include <string>
#include <vector>

using namespace std;

#ifndef BOARD_H
#define BOARD_H

class Board{
private:
	vector<string>* grid;
	int rows;
	int columns;
public:
	Board(int, int);
	Board(const Board&);
	int get_rows() const;
	int get_columns() const;
	const vector<string>* get_board() const;
	void print();
	~Board();
};

#endif