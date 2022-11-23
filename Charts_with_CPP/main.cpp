//  Добавьте на стороне C++ класс с описанием метрик графика: цвет, название параметра, enum
//  с типом графика, вектор значений по x, возрастающий от 0 до 5 с шагом 0.1, вектор значений
//  по y, который будет высчитываться при изменении типа графика.

//  Зарегистрируйте этот тип, добавьте отрисовку графика в QML на базе этого зарегистрированного типа.

//  Виды графиков: sin(x), y = x, y = |x - 2.5|, y = x^2, y = log2(x).

//  К практическому заданию приложите скриншоты графиков.


#include <QApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
