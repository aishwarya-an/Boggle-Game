QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Game of Boggle
TEMPLATE = app


SOURCES += main.cpp\
        bogglesolver.cpp Boggle.cpp Board.cpp Trie.cpp

HEADERS  += bogglesolver.h Boggle.h Board.h Trie.h

FORMS    += bogglesolver.ui
