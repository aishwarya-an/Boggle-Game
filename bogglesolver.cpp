#include "bogglesolver.h"
#include "ui_bogglesolver.h"
#include <QTableWidget>
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QDialog>
#include <QColor>

Bogglesolver::Bogglesolver(QMainWindow *parent) :
    QMainWindow(parent),
    ui(new Ui::Bogglesolver)
{
    ui->setupUi(this);
}

Bogglesolver::~Bogglesolver()
{
    delete ui;
}

void Bogglesolver::on_lineEdit_returnPressed()
{
    row = ui->lineEdit->text().toInt();
    ui->lineEdit_2->setFocus();
}

void Bogglesolver::on_lineEdit_2_returnPressed()
{
    column = ui->lineEdit_2->text().toInt();
    game = new Boggle(row, column, "Dictionary.txt");
    ui->commandLinkButton->setEnabled(true);
}

void Bogglesolver::on_commandLinkButton_clicked()
{
    ui->lineEdit->hide();
    ui->lineEdit_2->hide();
    ui->commandLinkButton->hide();
    ui->label_3->hide();
    ui->label_2->hide();
    ui->label->hide();
    ui->label_4->hide();
    ui->tableWidget->hide();
    display_next_window();
    timer = new QTimer();
    time = new QTime(0, 3, 0);
    connect(timer, SIGNAL(timeout()), this, SLOT(display_time()));
    timer->start(1000);
    input_words = new vector<string>();
    connect(input, SIGNAL(returnPressed()), this, SLOT(get_word()));
}


void Bogglesolver::display_next_window(){
    QVBoxLayout* main_layout = new QVBoxLayout();
    QVBoxLayout* layout = new QVBoxLayout();
    QVBoxLayout* layout1 = new QVBoxLayout();
    QHBoxLayout* layout2 = new QHBoxLayout();
    QHBoxLayout* layout3 = new QHBoxLayout();
    QVBoxLayout* user_layout = new QVBoxLayout();
    QVBoxLayout* system_layout = new QVBoxLayout();
    display = new QLCDNumber();
    display->setSegmentStyle(QLCDNumber::Flat);
    input = new QLineEdit(this);
    word_list = new QListWidget(this);
    word_list->setMinimumHeight(261);
    word_list->setMinimumWidth(151);
    layout->addWidget(input);
    layout->addWidget(word_list);
    layout->setSpacing(20);
    QTableWidget* Boggleboard = new QTableWidget(game->get_board()->get_rows(), game->get_board()->get_columns(), this);
    int i = 0;
    int k = 0;
    const vector<string>* grid = game->get_board()->get_board();
    while(i < game->get_board()->get_rows()){
        int j = 0;
        while(j < game->get_board()->get_columns()){
            QString line = QString(("     " + (*grid)[k]).c_str());
            QTableWidgetItem *pCell = Boggleboard->item(i, j);
            if(!pCell)
            {
                pCell = new QTableWidgetItem;
                pCell->setBackgroundColor(QColor(0, 170, 255, 255));
                pCell->setForeground(QBrush(QColor(85, 0, 0, 255)));
                Boggleboard->setItem(i, j, pCell);
            }
            pCell->setText(line);
            ++j;
            ++k;
        }
        ++i;
    }
    Boggleboard->setEnabled(false);
    Boggleboard->setMinimumWidth((game->get_board()->get_columns() * 50) + 3);
    Boggleboard->setMinimumHeight((game->get_board()->get_rows() * 40) + 2);
    Boggleboard->horizontalHeader()->setDefaultSectionSize(50);
    Boggleboard->verticalHeader()->setDefaultSectionSize(40);
    Boggleboard->horizontalHeader()->hide();
    Boggleboard->verticalHeader()->hide();
    QFont f("Ubuntu", 11, 75);
    f.setUnderline(false);
    Boggleboard->setFont(f);
    QLabel* timer_label = new QLabel("Timer", this);
    timer_label->setFont(f);
    QLabel* board_label = new QLabel("Your boggle board", this);
    board_label->setFont(f);
    layout1->addWidget(timer_label);
    layout1->addWidget(display);
    layout1->addWidget(board_label);
    layout1->addWidget(Boggleboard);
    layout2->addLayout(layout);
    layout2->addLayout(layout1);
    QLabel* instructions = new QLabel(this);
    instructions->setText(QString("RULES:\nGive all the valid words which can be formed using the letters in the above board according to the")
     + "following rules : \n    1. A valid word must be composed by following a sequence of adjacent dice — two dice are adjacent"
     + " if they are horizontal, vertical, or diagonal neighbours. \n   2. A valid word can use each die at most once.\n    "
     + "3. A valid word must contain at least 3 letters. \n    4. A valid word must be in the dictionary (which typically does "
     + "not contain proper nouns).\nPoints will be given according to the length of the words you form.");
    instructions->setWordWrap(true);
    f.setWeight(50);
    instructions->setFont(f);
    instructions->setMinimumHeight(330);
    instructions->setMinimumWidth(250);
    layout2->addWidget(instructions);
    main_layout->addLayout(layout2, 2);
    wrong_words = new QListWidget(this);
    QLabel* user_label = new QLabel("Wrong words", this);
    user_layout->addWidget(user_label);
    user_layout->addWidget(wrong_words);
    wrong_words->setMinimumWidth(310);
    wrong_words->setMinimumHeight(150);
    possible_words = new QListWidget(this);
    QLabel* possible_label = new QLabel("Words which can be formed.", this);
    system_layout->addWidget(possible_label);
    system_layout->addWidget(possible_words);
    possible_words->setMinimumWidth(310);
    possible_words->setMinimumHeight(150);
    layout3->addLayout(user_layout);
    layout3->addLayout(system_layout);
    main_layout->addLayout(layout3);
    main_layout->setSpacing(20);
    input->setFont(f);
    word_list->setFont(f);
    wrong_words->setFont(f);
    possible_words->setFont(f);
    wrong_words->setEnabled(false);
    possible_words->setEnabled(false);
    ui->centralwidget->setLayout(main_layout);
    int minHeight = (Boggleboard->minimumHeight() + 110 > instructions->minimumHeight()) ? Boggleboard->minimumHeight() + 110
                                                                                         : instructions->minimumHeight();
    cout << minHeight << endl;
    this->setGeometry(0, 0, word_list->minimumWidth() + Boggleboard->minimumWidth() + instructions->minimumWidth() + 100,
                      minHeight + possible_words->minimumHeight() + 100);
}


void Bogglesolver::show_words(){
    vector<string>* wrong = game->run(input_words);
    int points_scored = (int)((*wrong)[wrong->size() - 1])[0];
    wrong->erase(wrong->end());
    int i = 0;
    while(i < wrong->size()){
        QListWidgetItem* item = new QListWidgetItem;
        item->setText((*wrong)[i].c_str());
        wrong_words->addItem(item);
        ++i;
    }
    i = 0;
    while(i < game->get_words()->size()){
        QListWidgetItem* item = new QListWidgetItem;
        item->setText((*game->get_words())[i].c_str());
        possible_words->addItem(item);
        ++i;
    }
    wrong_words->setEnabled(true);
    possible_words->setEnabled(true);
    wrong_words->show();
    possible_words->show();
    QDialog* score = new QDialog(this);
    score->setWindowTitle("Score");
    score->show();
    QLabel* user_score = new QLabel("Your score is : " + QString::number(points_scored), score);
    QLabel* possible_score = new QLabel("Total points which could have been scored : " + QString::number(game->get_points()), score);
    QPushButton* ok = new QPushButton("OK", score);
    connect(ok, SIGNAL(clicked()), score, SLOT(close()));
    QVBoxLayout* score_layout=  new QVBoxLayout();
    score_layout->addWidget(user_score);
    score_layout->addWidget(possible_score);
    score_layout->addWidget(ok);
    score->setLayout(score_layout);
}

void Bogglesolver::display_time(){
    if(time != NULL && time->toString("mm:ss").toStdString() == "00:00"){
        delete timer;
        timer = NULL;
        delete time;
        time = NULL;
        input->setEnabled(false);
        show_words();
        return;
    }
    else{
        if(time != NULL){
            *time = QTime(0, time->addSecs(-1).minute(),time->addSecs(-1).second());
            display->display(time->toString("mm:ss"));
        }
    }
}


void Bogglesolver::get_word(){
    if(!time->isNull()){
        input_words->insert(input_words->end(), input->text().toStdString());
        word_list->addItem(input->text());
        word_list->show();
        input->clear();
    }
}
