// Сделайте в JS-файле функцию,
// возвращающую координаты точек для отрисовки нескольких фигур:
// звёздочка, кольцо, домик, песочные часы, и используйте их в Canvas.

// Выбор типа фигуры сделайте из выпадающего списка.


import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Shapes.js" as JS

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("JavaScript and Canvas")

    Canvas {
        id: convas
        anchors.fill: parent
        property int xStep: width / 6
        property int yStep: height / 5

        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
            ctx.fillStyle = Qt.rgba(1, 0, 0, 1); // Красный
            JS.getSnape(ctx, xStep, yStep, comboBox.currentIndex);
            ctx.lineWidth = 15;
            ctx.stroke();
            ctx.fill();
        }
    }

    ComboBox {
        id: comboBox
        model: ["Сердце", "Звёздочка", "Кольцо", "Домик", "Песочные часы"]

        onActivated: {
            convas.requestPaint();
        }
    }
}
