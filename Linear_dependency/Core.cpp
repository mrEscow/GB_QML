#include "Core.h"
#include <QtMath>

Core::Core(QObject *parent)
    : QObject{parent}
{
    m_Xs <<  7  << 31 <<  61 <<  99 <<  129 <<  178 <<  209;
    m_Ys <<  13 << 10 <<  9  <<  10 <<  12  <<  20  <<  26;

    linearDependency();
}

void Core::linearDependency()
{
    //-------- Поиск корней уравнения прямой (Метод Крамера)

    m_length = m_Xs.length() < m_Ys.length() ? m_Xs.length() :  m_Ys.length();
    qDebug() << "Length:" << m_length;
    double sumX = 0;
    double sumY = 0;
    double sumXY = 0;
    double sumXX = 0;

    for (int i = 0; i < m_length; i++){
        sumX += m_Xs[i];
        sumY += m_Ys[i];
        sumXY += m_Xs[i] * m_Ys[i];
        sumXX += m_Xs[i] * m_Xs[i];
    }

    double det = 0; // Для определителя матрицы
    double err = 0; // Оценка погрешности

    det = sumXX * m_length - sumX * sumX;

    a = (sumXY * m_length - sumY * sumX) / det;
    b = (sumXX * sumY - sumXY * sumX) / det;

    for (int i = 0; i < m_length; i++)
        err += qPow((m_Ys[i] - (a * m_Xs[i] + b)), 2);

    if (b > 0)
        createLine(true);
    else
        createLine(false);

    //qDebug() << "Сумма квадрата погрешностей:" << err;
}

void Core::createLine(bool b/*>0*/)
{
    qreal h = 1;
    qreal min = 1;
    qreal max = 250 + h;
    qreal tempX = min;

    m_lengthLine = (max - min) / h + 2;

    for (int i = 0; i < m_lengthLine; ++i) {
        if(tempX <= max)
        {
            m_XsLine.push_back(tempX);

            if(b)
                m_YsLine.push_back((a * tempX) + b);
            else
                m_YsLine.push_back((a * tempX) - b);
        }
        tempX += h;
    }

}





















