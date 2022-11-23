#ifndef CORE_H
#define CORE_H

#include <QtQml/qqml.h> // Необходимый заголовочный файл
#include <Auto_property.h>
#include <QObject>

class Core : public QObject
{
    Q_OBJECT
    QML_ELEMENT // Необходимый макрос для регистрации
    AUTO_PROPERTY(QVector<qreal>, Xs)
    AUTO_PROPERTY(QVector<qreal>, Ys)
    AUTO_PROPERTY(int, length)

    AUTO_PROPERTY(QVector<qreal>, XsLine)
    AUTO_PROPERTY(QVector<qreal>, YsLine)
    AUTO_PROPERTY(int, lengthLine)

public:
    explicit Core(QObject *parent = nullptr);

signals:

private:
    void linearDependency();
    void createLine(bool b/*>0*/);

    double a{0};
    double b{0};
};

#endif // CORE_H
