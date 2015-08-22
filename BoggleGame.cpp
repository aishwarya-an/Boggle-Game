// This is the Boggle Game where the player has to form words from the letters given in a board.

#include <iostream>
#include "Boggle.h"

using namespace std;

int main(){
	cout << endl << "~~~~~~~~WELCOME TO THE BOGGLE GAME~~~~~~~~~~" << endl << "Choose any options(1 or 2 or 3) given" 
	<< " below to continue...." << endl << endl << "1. Demo on how to play the game." << endl << "2. Play the game." << endl 
	<< "3. Exit." << endl << "Enter only the number of the option you choose  :  ";
	int option;
	cin >> option;
	do{
		switch(option){
			case 1: {
						cout << endl << "Welcome to the Demo mode" << endl 
						<< "Press 1 to start and 0 to exit from the demo mode : ";
						int num;
						cin >> num;
						if(num){
							cout << endl << "You need to first enter the specifications of the board you want i.e the number of " 
							<< "rows and columns of the board." << endl <<  "Then, the board according to your specification is " 
							<< "printed." << endl << endl << "Give all the valid words which can be formed using the letters in the" 
							<< " above board according to the following rules : " << endl << "1. A valid word must be composed by " 
							<< "following a sequence of adjacent dice — two dice are adjacent if they are horizontal, vertical, or " 
							<< "diagonal neighbours." << endl << "2. A valid word can use each die at most once." << endl << "3. A " 
							<< "valid word must contain at least 3 letters." << endl << "4. A valid word must be in the dictionary" 
							<< " (which typically does not contain proper nouns)." << endl << "Points will be given according to " 
							<< "the length of the words you form." << endl << endl << "Word Size	Points for the word "<< endl 
							<< "3 to 4   	  1\n   5		 2\n   6		 3\n   7		 5\n8 or more	 11" << endl << endl 
							<< "Now, see the demo where the board is of 5 X 5 specification...." << endl << endl;
						 	Boggle* demo = new Boggle(5, 5, "Dictionary.txt");
						 	cout << "The boggle board is : " << endl;
						 	demo->print_board();
						 	demo->print_words();
						 	cout << "Total points scored for all the above words is : " << demo->get_points() << endl;
						}
						cout << endl << "Press 1 to get demo, 2 to play and 3 to exit from the game.....";
						cin >> option;
					}
					 break;
			case 2: {
						int rows, columns;
						cout << endl << "Please enter the specification of the board you want..." << endl;
						cout << "Number of rows (greater than 4) : ";
						cin >> rows;
						cout << "Number of columns (greater then 4) : ";
						cin >> columns;
						cout << "You game starts NOW!!!" << endl << endl;
						Boggle* one = new Boggle(rows, columns, "Dictionary.txt");
						one->run();
						cout << endl << "Press 1 to get demo, 2 to play again and 3 to exit from the game.....";
						cin >> option;
					}
					break;
			case 3: cout << endl << "Exiting the game. Thank you for playing the game. " << endl << endl;
					break;
			default: cout << endl << "There is no such option. Exiting the game...." << endl << endl;
			 		 break;
		}
	}while(option == 1 || option == 2);
	cout << endl << "Exiting the game. Thank you for playing the game. " << endl << endl;
}