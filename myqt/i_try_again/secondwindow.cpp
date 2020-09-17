#include "secondwindow.h"
#include "ui_secondwindow.h"

SecondWindow::SecondWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::SecondWindow)
{
    ui->setupUi(this);
    ui->op_slosh->setChecked(true);
}

SecondWindow::~SecondWindow()
{
    delete ui;
}

void SecondWindow::on_op_slosh_toggled(bool checked)
{
    if (checked) {
        ui->labela->setText("слагаемое 1");
        ui->labelb->setText("слагаемое 2");
        ui->labelresult->setText("сумма");
    }
}

void SecondWindow::on_op_min_toggled(bool checked)
{
    if (checked) {
        ui->labela->setText("уменьшаемое");
        ui->labelb->setText("вычитаемое");
        ui->labelresult->setText("разность");
    }
}


void SecondWindow::on_op_umn_toggled(bool checked)
{
    if (checked) {
        ui->labela->setText("множитель 1");
        ui->labelb->setText("множитель 2");
        ui->labelresult->setText("произведение");
    }
}


void SecondWindow::on_op_del_toggled(bool checked)
{
    if (checked) {
        ui->labela->setText("делимое");
        ui->labelb->setText("делитель");
        ui->labelresult->setText("частное");
    }
}

void SecondWindow::on_end_clicked()
{
    QString op1 = ui->num1->text();
    QString op2 = ui->num2->text();
    int a, b, e0;
    int result;
    bool okA, okB;
    a = op1.toInt(&okA);
    b = op2.toInt(&okB);
    ui->finaltext->clear();
    if (ui->op_slosh->isChecked()){
        result = a+b;
    }
    if (ui->op_min->isChecked()){
        result = a-b;
    }
    if (ui->op_umn->isChecked()){
        result = a*b;
    }
    if (ui->op_del->isChecked()){
        if (b==0){
            e0=1;
        }
        else{
            result = a/b;
        }
    }
    QString resulttext = QString::number(result);

    if (okA && okB){
        //ok A and B
        ui->labelerror->setText("");
        QPalette pal = ui->num1->palette();
        pal.setColor(QPalette::Base, QColor::fromRgb(255,255,255));
        ui->num1->setPalette(pal);
        pal = ui->num2->palette();
        pal.setColor(QPalette::Base, QColor::fromRgb(255,255,255));
        ui->num2->setPalette(pal);
        if (e0==1){
            ui->labelerror->setText("На 0 делить нельзя!");
        }
            else{
        ui->finaltext->setText(resulttext);
        e0=0;
            };
    }
    else {
        if (!okA && !okB){
            //not A and B
            ui->labelerror->setText("Оба ввода неверны");
            QPalette pal = ui->num1->palette();
            pal.setColor(QPalette::Base, QColor::fromRgb(255,255,0));
            ui->num1->setPalette(pal);
            pal = ui->num2->palette();
            pal.setColor(QPalette::Base, QColor::fromRgb(255,255,0));
            ui->num2->setPalette(pal);
        }
        else if (!okA){
            //not A
            ui->labelerror->setText("Первый ввод неверен");
            QPalette pal = ui->num1->palette();
            pal.setColor(QPalette::Base, QColor::fromRgb(255,255,0));
            ui->num1->setPalette(pal);
            pal = ui->num2->palette();
            pal.setColor(QPalette::Base, QColor::fromRgb(255,255,255));
            ui->num2->setPalette(pal);
        }
        else {
            //not B
            ui->labelerror->setText("Второй ввод неверен");
            QPalette pal = ui->num1->palette();
            pal.setColor(QPalette::Base, QColor::fromRgb(255,255,0));
            ui->num2->setPalette(pal);
            pal = ui->num1->palette();
            pal.setColor(QPalette::Base, QColor::fromRgb(255,255,255));
            ui->num1->setPalette(pal);
        }
    }

}
