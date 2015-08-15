// This is the declaration file of Board class

#include "Board.h"

using namespace std;

// This is the constructor which takes in the number of rows and columns of the board to be constructed.
Board::Board(int row, int column){

}

// This is the copy constructor which takes in another object and copies its contents into another object.
Board::Board(const Board &another){

}

// This function returns the number of rows in the grid.
int Board::get_rows() const{
	return 0;
}

// This function returns the number of columns in the board.
int Board::get_columns() const{
	return 0;
}

// This function returns the grid.
const vector<string>* Board::get_board() const{
	return new vector<string>();
}

// This function prints the board.
void Board::print(){

}

// This is the destructor which frees the memory dynamically allocated by the constructor.
Board::~Board(){

}