// This is the declaration file of Board class

#include <cstdlib>
#include <ctime>
#include "Board.h"

using namespace std;

// This is the constructor which takes in the number of rows and columns of the board to be constructed. The number of rows and
// columns in the board should be atleast 4. So, if the number of rows and columns taken in is < 4, then the board is constructed
// with the number of rows and columns to be 4. It then gets a random letter and puts the same into each block of the grid. Since,
// there are only a few words starting with the letter 'Q' and most of those words start with "Qu", the board has "Qu" instead 
// of only the letter 'Q'.
Board::Board(int row, int column){
	if(row < 4)
		row = 4;
	if(column < 4)
		column = 4;
	rows = row;
	columns = column;
	srand(time(NULL));
	grid = new vector<string>(rows * columns, "");
	int i = 0;
	while(i < grid->size()){
		(*grid)[i] = (rand() % 26) + 65;
		if((*grid)[i] == "Q")
			(*grid)[i] = "Qu";
		++i;
	}
}

// This is the copy constructor which takes in another object and copies its contents into another object.
Board::Board(const Board &another){
	const vector<string>* another_grid = another.get_board();
	grid = new vector<string>(*another_grid);
	rows = another.get_rows();
	columns = get_columns();
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
	delete grid;
}