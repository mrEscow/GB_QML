#include "Metrixs.h"
#include <QtMath>

Metrixs::Metrixs(QObject *parent)
    : QObject{parent}
{
    // вектор значений по x, возрастающий от 0 до 5 с шагом 0.1
    for (qreal x = 0; x <= 5; x += 0.1f) {
        Xs.push_back(x);
    }

    m_length = Xs.length();
}

void Metrixs::y_sinX()
{
    Ys.clear();
    for(const auto x: Xs)
        Ys.push_back(qSin(x));
    minmaxY();
}

void Metrixs::y_X()
{
    Ys.clear();
    for(const auto x: Xs)
        Ys.push_back(x);
    minmaxY();
}

void Metrixs::y_modX()
{
    Ys.clear();
    for(const auto x: Xs){
        auto t = x - 2.5;
        if(t<0)
            t *= - 1;
        Ys.push_back(t);
    }
    minmaxY();
}

void Metrixs::y_sqrtX()
{
    Ys.clear();
    for(const auto x: Xs)
        Ys.push_back(qSqrt(x));
    minmaxY();
}

void Metrixs::y_log2X()
{
    //  logx (y) = ln (y) / ln (x),
    Ys.clear();
    for(const auto x: Xs)
        Ys.push_back(qLn(2)/qLn(x));
    minmaxY();
}

void Metrixs::minmaxY()
{
    auto minmax = std::minmax_element(std::begin(Ys), std::end(Ys));
    m_Ymin = *(minmax.first);
    m_Ymax = *(minmax.second);

    qDebug() << "Ymin" << m_Ymin;
    qDebug() << "Ymax" << m_Ymax;

}
