#ifndef FIRSTWIDGET_H
#define FIRSTWIDGET_H

#include <QWidget>

namespace Ui {
class FirstWidget;
}

class FirstWidget : public QWidget
{
    Q_OBJECT

public:
    explicit FirstWidget(QWidget *parent = nullptr);
    ~FirstWidget();

private slots:
    void on_testbutton_clicked();

private:
    Ui::FirstWidget *ui;
};

#endif // FIRSTWIDGET_H
