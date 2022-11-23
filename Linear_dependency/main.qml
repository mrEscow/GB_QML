import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts 2.15
import ru.escow.Core 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Linear dependency")

    Core {
        id: core
    }

    Item {
        anchors.fill: parent
        ChartView {
            title: "Диаграмма рассеяния"
            anchors.fill: parent
            antialiasing: true
            ScatterSeries {
                id: scatterSeries
                name: "Набор данных 1"
                axisX: ValueAxis { min: 0.0; max: 220.0 } // Ось OX
                axisY: ValueAxis { min: 0.0; max: 30.0 } // Ось OY


            }

            LineSeries {
                id: lineSeries
                name: "Уравнения прямой"
            }
        }
    }

    Component.onCompleted: setNewPoints();

    function setNewPoints(){

        scatterSeries.clear()
        for(var i = 0; i < core.length; i++){
            scatterSeries.append(core.Xs[i], core.Ys[i])
        }

        lineSeries.clear()
        for(var y = 0; y < core.lengthLine; y++){
            lineSeries.append(core.XsLine[y], core.YsLine[y])
        }
    }
}
