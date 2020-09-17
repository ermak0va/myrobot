#ifndef SECONDWINDOW_H
#define SECONDWINDOW_H

#include <QMainWindow>

namespace Ui {
class SecondWindow;
}

class SecondWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit SecondWindow(QWidget *parent = nullptr);
    ~SecondWindow();

private slots:
    void on_op_slosh_toggled(bool checked);

    void on_op_min_toggled(bool checked);

    void on_op_umn_toggled(bool checked);

    void on_op_del_toggled(bool checked);

    void on_end_clicked();

private:
    Ui::SecondWindow *ui;
};

#endif // SECONDWINDOW_H
