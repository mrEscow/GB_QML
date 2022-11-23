import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
import QtQuick.Layouts 1.15
import ru.escow.Metrixs 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Charts with C++")

    Metrixs {
        id: matrixs
    }

    function resetMatrix(chart){

        lineSeries1.clear();
        lineSeries2.clear();
        lineSeries3.clear();
        lineSeries4.clear();
        lineSeries5.clear();

        switch(chart){
        case(0):
            matrixs.y_sinX();
            print("matrixs.y_sinX()")
            break;
        case(1):
            matrixs.y_X();
            print("matrixs.y_X()")
            break;
        case(2):
            matrixs.y_modX();
            print("matrixs.y_sinX()")
            break;
        case(3):
            matrixs.y_sqrtX();
            print("matrixs.y_modX()")
            break;
        case(4):
            matrixs.y_log2X();
            print("matrixs.y_log2X()")
            break;
        }

        var x = matrixs.getXs()
        var y = matrixs.getYs()
        var l = matrixs.length

        for(var i = 0; i < matrixs.length; i++){
            lineSeries1.append(x[i],y[i]);
            lineSeries2.append(x[i],y[i]);
            lineSeries3.append(x[i],y[i]);
            lineSeries4.append(x[i],y[i]);
            lineSeries5.append(x[i],y[i]);
        }

//        lineSeries1.axisYChanged();
//        lineSeries2.axisYChanged();
//        lineSeries3.axisYChanged();
//        lineSeries4.axisYChanged();
//        lineSeries5.axisYChanged();
    }

    Item {
        anchors.fill: parent


        ColumnLayout {
            anchors.fill: parent
            spacing: 10
            TabBar {
                id: bar
                //Layout.fillHeight: true
                Layout.fillWidth: true

                Repeater {
                    id: repeater
                    model: ["Y = Sin(X)", "Y = X", "Y = |X - 2.5|", "Y = X^2", "Y = log2(X)"]

                    TabButton {
                        text: modelData
                        onClicked: resetMatrix(bar.currentIndex);
                    }
                }
            }

            StackLayout {
                id: stack
                Layout.fillHeight: true
                Layout.fillWidth: true
                currentIndex: bar.currentIndex

                ChartView {
                    title: "Y = Sin(X)"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    legend.alignment: Qt.AlignBottom
                    antialiasing: true
                    LineSeries {
                        id: lineSeries1
                        name:  "Y = Sin(X)"
                        width: 3
                        color: matrixs.color
                        axisX: ValueAxis { min: matrixs.Xmin; max: matrixs.Xmax } // Ось OX
                        axisY: ValueAxis { min: matrixs.Ymin; max: matrixs.Ymax } // Ось OY
                    }
                }

                ChartView {
                    title: "Y = X"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    legend.alignment: Qt.AlignBottom
                    antialiasing: true
                    LineSeries {
                        id: lineSeries2
                        name: "Y = X"
                        width: 3
                        color: matrixs.color
                        axisX: ValueAxis { min: matrixs.Xmin; max: matrixs.Xmax } // Ось OX
                        axisY: ValueAxis { min: matrixs.Ymin; max: matrixs.Ymax } // Ось OY
                    }
                }

                ChartView {
                    title: "Y = |X - 2.5|"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    legend.alignment: Qt.AlignBottom
                    antialiasing: true
                    LineSeries {
                        id: lineSeries3
                        name: "Y = |X - 2.5|"
                        width: 3
                        color: matrixs.color
                        axisX: ValueAxis { min: matrixs.Xmin; max: matrixs.Xmax } // Ось OX
                        axisY: ValueAxis { min: matrixs.Ymin; max: matrixs.Ymax } // Ось OY
                    }
                }

                ChartView {
                    title: "Y = X^2"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    legend.alignment: Qt.AlignBottom
                    antialiasing: true
                    LineSeries {
                        id: lineSeries4
                        name: "Y = X^2"
                        width: 3
                        color: matrixs.color
                        axisX: ValueAxis { min: matrixs.Xmin; max: matrixs.Xmax } // Ось OX
                        axisY: ValueAxis { min: matrixs.Ymin; max: matrixs.Ymax } // Ось OY
                    }
                }

                ChartView {
                    title: "Y = log2(X)"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    legend.alignment: Qt.AlignBottom
                    antialiasing: true
                    LineSeries {
                        id: lineSeries5
                        name: "Y = log2(X)"
                        width: 3
                        color: matrixs.color
                        axisX: ValueAxis { min: matrixs.Xmin; max: matrixs.Xmax } // Ось OX
                        axisY: ValueAxis { min: matrixs.Ymin - 5; max: matrixs.Ymax + 50 } // Ось OY
                    }
                }


            }
        }

        Component.onCompleted: resetMatrix(0)
    }
}
