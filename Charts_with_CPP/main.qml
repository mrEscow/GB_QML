import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts 2.15
import ru.escow.Metrixs 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Charts with C++")

    Item {
        anchors.fill: parent
        property variant othersSlice: 0

        ChartView {
            id: chart
            title: "Top-5 car brand shares in Finland"
            anchors.fill: parent
            legend.alignment: Qt.AlignBottom
            antialiasing: true

            PieSeries {
                id: pieSeries
                PieSlice { label: "Volkswagen"; value: 13.5 }
                PieSlice { label: "Toyota"; value: 10.9 }
                PieSlice { label: "Ford"; value: 8.6 }
                PieSlice { label: "Skoda"; value: 8.2 }
                PieSlice { label: "Volvo"; value: 6.8 }
            } // Доли графика будут рассчитаны автоматически
        }
        Component.onCompleted: {
            othersSlice = pieSeries.append("Others", 52.0);
            pieSeries.find("Volkswagen").exploded = true;

            print(Metrixs.PolarCharts);
        }


    }

}
