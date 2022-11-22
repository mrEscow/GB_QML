#pragma once
#include <QtQml/qqml.h> // Необходимый заголовочный файл
#include "Auto_property.h"
#include <QObject>
#include <QColor>
#include <QString>

class Metrixs : public QObject
{
    Q_OBJECT

    QML_ELEMENT // Необходимый макрос для регистрации

    AUTO_PROPERTY(QColor, color)
    AUTO_PROPERTY(QString, name)

public:
    enum Charts {
        BarChart,
        PieChart,
        CandlestickChart,
        PolarChart
    };
    Q_ENUM(Charts)

public:
    explicit Metrixs(QObject *parent = nullptr);

signals:

public slots:
    void Y_sinX();
    void Y_X();
    void Y_modX();
    void Y_sqrtX();
    void Y_log2X();
private:
    QVector<qreal> Xs;
    QVector<qreal> Ys;
};

