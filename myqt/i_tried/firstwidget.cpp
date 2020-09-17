#include "firstwidget.h"
#include "ui_firstwidget.h"

FirstWidget::FirstWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::FirstWidget)
{
    ui->setupUi(this);
}

FirstWidget::~FirstWidget()
{
    delete ui;
}
// нажатие на кнопку
void FirstWidget::on_testbutton_clicked()
{
    //получить
    QString text = ui->intext->text();
    bool ok;
    int a = text.toInt(&ok);
    if (ok){
        int b = a*a;
        QString result = QString::number(b);
        ui->errortext->clear();
        ui->justtext->setText(result);
         }
    else{
        ui->justtext->clear();
        ui->errortext->setText("error");

    }
}
