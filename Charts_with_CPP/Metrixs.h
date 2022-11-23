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

    Q_PROPERTY(qreal Xmin READ Xmin CONSTANT)
    Q_PROPERTY(qreal Xmax READ Xmax CONSTANT)
    Q_PROPERTY(qreal Ymin READ Ymin CONSTANT)
    Q_PROPERTY(qreal Ymax READ Ymax CONSTANT)

public:
    enum Charts {
        Y_sinX,
        Y_X,
        Y_modX,
        Y_sqrtX,
        Y_log2X
        };
    Q_ENUM(Charts)
    void setPriority(Charts chart);
    Charts chart() const;
public:
    Q_INVOKABLE QVector<qreal> getXs(){ return Xs;}
    Q_INVOKABLE QVector<qreal> getYs(){ return Ys;}

    Q_INVOKABLE int length(){ return m_length;}

    Q_INVOKABLE qreal Xmin(){ return m_Xmin;}
    Q_INVOKABLE qreal Xmax(){ return m_Xmax;}
    Q_INVOKABLE qreal Ymin(){ return m_Ymin;}
    Q_INVOKABLE qreal Ymax(){ return m_Ymax;}

public:
    explicit Metrixs(QObject *parent = nullptr);

signals:

public slots:
    void y_sinX();
    void y_X();
    void y_modX();
    void y_sqrtX();
    void y_log2X();

    void minmaxY();
private:
    QVector<qreal> Xs;
    QVector<qreal> Ys;

    int m_length{0};

    qreal m_Xmin{0.0}, m_Xmax{5.0}, m_Ymin{-5.0}, m_Ymax{5.0};
};

