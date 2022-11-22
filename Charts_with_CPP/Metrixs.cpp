#include "Metrixs.h"
#include <QtMath>

Metrixs::Metrixs(QObject *parent)
    : QObject{parent}
{
    // вектор значений по x, возрастающий от 0 до 5 с шагом 0.1
    for (qreal x = 0; x <= 5; x += 0.1f) {
        Xs.push_back(x);
    }
}

void Metrixs::Y_sinX()
{
    Ys.clear();
    for(const auto x: Xs)
        Ys.push_back(qSin(x));
}

void Metrixs::Y_X()
{
    Ys.clear();
    for(const auto x: Xs)
        Ys.push_back(x);
}

void Metrixs::Y_modX()
{
    Ys.clear();
    for(const auto x: Xs){
        auto t = x - 2.5;
        if(t<0)
            t *= - 1;
        Ys.push_back(t);
    }
}

void Metrixs::Y_sqrtX()
{
    Ys.clear();
    for(const auto x: Xs)
        Ys.push_back(qSqrt(x));
}

void Metrixs::Y_log2X()
{
    //  logx (y) = ln (y) / ln (x),
    Ys.clear();
    for(const auto x: Xs)
        Ys.push_back(qLn(2)/qLn(x));
}
