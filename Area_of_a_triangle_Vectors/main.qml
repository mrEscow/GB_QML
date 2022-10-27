import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Area_of_a_triangle_Vectors")

    readonly property color bgColor: "#6a7bd3"
    readonly property color bubbleColor: "#9a3b98"

    property int defHeight: (height - 50) / 4
    property int defMargin: 10
    property int defRadius: 15

    property int textPixels: {
        if(width===700) return 28;
        else if (width<700 && width>=600) return 25;
        else if (width<600 && width>=500) return 21;
        else if (width<500 && width>=320) return 16;
        else if (width<320 && width>=200) return 12;
    }

    property string result: "результат"

    function calculate(ax,ay,bx,by,cx,cy){
        // Дано:
        var bz = 0;
        var az = 0;
        var cz = 0;
        console.log("A(" + ax + "," + ay + "," + az + ")");
        console.log("B(" + bx + "," + by + "," + bz + ")");
        console.log("C(" + cx + "," + cy + "," + cz + ")");
        // Решение:
        // Находим вектор a по точкам
        var a = [Number(bx) - Number(ax), Number(by) - Number(ay), Number(bz) - Number(bz)];
        // Находим вектор b по точкам
        var b = [Number(cx) - Number(ax), Number(cy) - Number(ay), Number(cz) - Number(az)];
        // Находим произведение векторов
        var axb = [0,0,0];
        axb[0] = a[1] * b[2] - a[2] * b[1];
        axb[1] = a[2] * b[0] - a[0] * b[2];
        axb[2] = a[0] * b[1] - a[1] * b[0];
        // Найдем модуль вектора
        var c = Math.sqrt((Number(axb[0]) * Number(axb[0])) + (Number(axb[1]) * Number(axb[1])) + (Number(axb[2]) * Number(axb[2])));
        if(c < 0)
            c *= -1
        // Найдем площадь треугольника, образованными векторами
        var s = c / 2;
        // Ответ:
        result = s;
    }

    Rectangle {
        anchors.fill: parent
        color: bgColor

        LabelRect {
            id: labelRect
        }

        ImageImputRect {
            id: imageImputRect
        }

        OutputRect {
            id: outputRect
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:5}
}
##^##*/
