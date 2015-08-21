// This is the declaration of the Board class

#include <iostream>
#include <string>
#include <vector>

using namespace std;

#ifndef BOARD_H
#define BOARD_H

struct frequencies{
	double array[26] = {
        0.08167, 0.01492, 0.02782, 0.04253, 0.12703, 0.02228,
        0.02015, 0.06094, 0.06966, 0.00153, 0.00772, 0.04025,
        0.02406, 0.06749, 0.07507, 0.01929, 0.00095, 0.05987,
        0.06327, 0.09056, 0.02758, 0.00978, 0.02360, 0.00150,
        0.01974, 0.00074};
};

class Board{
private:
	vector<string>* grid;
	int rows;
	int columns;
    // The frequencies of letters in the English alphabet
   	frequencies letters;
    int get_number();
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