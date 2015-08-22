CXX = g++

# The name of the executable is game.
game: BoggleGame.cpp Boggle.o Board.o Trie.o
	$(CXX) -o game BoggleGame.cpp Boggle.o Board.o Trie.o

Boggle.o: Boggle.cpp
	$(CXX) -c Boggle.cpp

Board.o: Board.cpp
	$(CXX) -c Board.cpp

Trie.o: Trie.cpp
	$(CXX) -c Trie.cpp

# To delete all the object files and the executable file 'game'
clean:
	rm -f *.o game