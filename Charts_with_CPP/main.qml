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

    Item {
        anchors.fill: parent
        property int chart: Metrixs.PieChart

        //property var othersSlice: 0

        ColumnLayout {
            anchors.fill: parent
            spacing: 10
            TabBar {
                id: bar
                //Layout.fillHeight: true
                Layout.fillWidth: true

                TabButton {
                    text: "PieChart"
                }
                TabButton {
                    text: "BarChart"
                }
                TabButton {
                    text: "CandlestickChart"
                }
                TabButton {
                    text: "PolarChart"
                }

            }

            StackLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true
                currentIndex: bar.currentIndex

                ChartView {
                    id: chart
                    title: "Top-5 car brand shares in Finland"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    legend.alignment: Qt.AlignBottom
                    antialiasing: true

                    LineSeries {
                        id: lineSeries
                        name: "LineSeries"
                    }
                }
            }
        }

        Component.onCompleted: {

            matrixs.y_sinX();

            var x = matrixs.getXs()
            var y = matrixs.getYs()

            var l = matrixs.length

            print("SIZE ", l)

            for(var i = 0; i < matrixs.length; i++){
                lineSeries.append(x[i],y[i]);
            }

        }
    }
}
