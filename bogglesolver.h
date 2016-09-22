#include "Boggle.h"

#ifndef BOGGLESOLVER_H
#define BOGGLESOLVER_H

#include <QMainWindow>
#include <QTimer>
#include <QTime>
#include <QLCDNumber>
#include <QListWidget>

namespace Ui {
class Bogglesolver;
}

class Bogglesolver : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit Bogglesolver(QMainWindow *parent = 0);
    ~Bogglesolver();
    
private slots:
    void on_lineEdit_returnPressed();

    void on_lineEdit_2_returnPressed();

    void on_commandLinkButton_clicked();

public slots:
    void display_time();
    void get_word();

private:
    Ui::Bogglesolver *ui;
    int row;
    int column;
    Boggle* game;
    QTimer* timer;
    QTime* time;
    QLCDNumber* display;
    QLineEdit* input;
    QListWidget* word_list;
    QListWidget* wrong_words;
    QListWidget* possible_words;
    vector<string>* input_words;
    void display_next_window();
    void show_words();
};

#endif // BOGGLESOLVER_H
