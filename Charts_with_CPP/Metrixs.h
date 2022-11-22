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

    Q_PROPERTY(QVector<qreal> Xs READ getXs CONSTANT)
    Q_PROPERTY(QVector<qreal> Ys READ getYs CONSTANT)

    Q_PROPERTY(int length READ length CONSTANT)

public:
    enum Charts {
        BarChart,
        PieChart,
        CandlestickChart,
        PolarChart
    };
    Q_ENUM(Charts)
    void setPriority(Charts chart);
    Charts chart() const;
public:
    Q_INVOKABLE QVector<qreal> getXs(){ return Xs;}
    Q_INVOKABLE QVector<qreal> getYs(){ return Ys;}

    Q_INVOKABLE int length(){ return m_length;}
//    Q_INVOKABLE void setLength(int){
//        length = Xs.length();
//    }


public:
    explicit Metrixs(QObject *parent = nullptr);

signals:

public slots:
    void y_sinX();
    void y_X();
    void y_modX();
    void y_sqrtX();
    void y_log2X();
private:
    QVector<qreal> Xs;
    QVector<qreal> Ys;

    int m_length{0};
};

