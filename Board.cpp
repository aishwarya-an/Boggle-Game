// This is the declaration file of Board class

#include <cstdlib>
#include <ctime>
#include "Board.h"

using namespace std;

// This is the constructor which takes in the number of rows and columns of the board to be constructed. The number of rows and
// columns in the board should be atleast 4. So, if the number of rows and columns taken in is < 4, then the board is constructed
// with the number of rows and columns to be 4. It then gets a letter according to the random number generated and puts the same
//  into each block of the grid. Since there are only a few words starting with the letter 'Q' and most of those words start with
//  "Qu", the board has "Qu" instead of only the letter 'Q'. Its running time is O(mn) where m and n are the number of rows and
// columns in the board.
Board::Board(int row, int column){
	if(row < 4)
		row = 4;
	if(column < 4)
		column = 4;
	rows = row;
	columns = column;
	grid = new vector<string>(rows * columns, "");
	int i = 0;
	srand(time(NULL));
	while(i < grid->size()){
		int letter = get_number();
		(*grid)[i] = letter + 65;
		++i;
	}
}


// This is a private function which is called by the constructor. It returns a random number i which has the probability 
// p, where p = frequencies[i]. The array frquencies[] is a private member containing the frquencies of the letters in the 
// English alphabet.
int Board::get_number(){
	double sum = 0.0;
    while(true){
    	// Getting a random real value in the interval [0.0, 1.0).
        double random = 1.00 * rand() / RAND_MAX;
        sum = 0.0;        
        for(int i = 0; i < 26; i++){
            sum += letters.array[i];
            if(sum > random) 
            	return i;
        }
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
	return rows;
}


// This function returns the number of columns in the board.
int Board::get_columns() const{
	return columns;
}


// This function returns the grid.
const vector<string>* Board::get_board() const{
	return grid;
}


// This function prints the board. Its running time is O(mn) where m and n are the number of rows and columns in the board.
void Board::print(){
	int i = 0;
	while(i < rows){
		int cell = i * columns;
		cout << "o";
		int j = 0;
		while(j < rows){
			cout << "---o";
			++j;
		}
		cout << endl << "|";
		while(cell < columns*(i+1)){
			cout << " " << (*grid)[cell];
			if((*grid)[cell] == "Qu")
				cout << "|";
			else
				cout << " |";
			++cell;
		}
		cout << endl;
		++i;
	}
	cout << "o";
	i = 0;
	while(i < rows){
		cout << "---o";
		++i;
	}
	cout << endl;
}


// This is the destructor which frees the memory dynamically allocated by the constructor.
Board::~Board(){
	delete grid;
}