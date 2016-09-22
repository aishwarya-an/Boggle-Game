# **Boggle Game**#
A game to build valid words out of the letters in a grid.  

---  

## **About Boggle Game** ##
This is a word game which involves a board of jumbled up dice, where each die has a letter printed on top of it. The player has to build valid words out of the letters in the board according to the following rules :  

* A valid word must be composed by following a sequence of adjacent dice — two dice are adjacent if they are horizontal, vertical, or diagonal neighbours.  
* A valid word can use each die at most once.  
* A valid word must contain at least 3 letters.  
* A valid word must be in the dictionary (which typically does not contain proper nouns).  
The player accumulates the points according to the length of the valid words built.  

##### The *Qu* special case: #####
In the English language, the letter Q is almost always followed by the letter U. Consequently, a die is printed with the two-letter sequence Qu instead of Q (and this two-letter sequence must be used together when forming words). When scoring, Qu counts as two letters; for example, the word QuEUE scores as a 5-letter word even though it is formed by following a sequence of 4 dice.  

##### Points Table : #####
|Word Length|Points for the word
|:--------:|:-----------------:|  
|3 to 4    |	    1          
|   5 	   |	    2          
|   6  	   |	    3          
|   7 	   |	    5          
|8 or more |   	    11            

## **Installation** ##
1. Download the source code along with the makefiles and the text file containing the dictionary.  
2. To play the *graphical version* of the game, compile and link the source files by executing the command  `make -f Makefile`   
3. To play the *terminal version* of the game, compile and link the source files by executing the command  `make -f Makefile2`  
4. Then, play the game by executing the command  `./Game`