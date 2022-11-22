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
        BarCharts,
        PieCharts,
        CandlestickCharts,
        PolarCharts
    };
    Q_ENUM(Charts)

public:
    explicit Metrixs(QObject *parent = nullptr);

signals:

};

