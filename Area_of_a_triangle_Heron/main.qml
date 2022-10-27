import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Area_of_a_triangle_Heron")
    color: "#9aff92"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15

        Text {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            verticalAlignment: Text.AlignVCenter
            text: "Рассчитать площадь по формуле Герона"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            Layout.fillWidth: false
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Rectangle {
            id: rectangle
            width: 200
            height: 200
            color: "#9aff92"
            Layout.fillWidth: true
            Layout.fillHeight: true


            RowLayout {
                anchors.fill: parent
                Image {
                    id: treygolnik
                    source: "qrc:/images/ploshadtreygolnika2.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                Image {
                    id: formula
                    source: "qrc:/images/ploshadtreygolnika2formula.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }

        Rectangle {
            id: rectangle1
            width: 200
            height: 200
            color: "#9aff92"
            Layout.fillHeight: true
            Layout.fillWidth: true


            GridLayout {
                id: grid
                anchors.fill: parent
                columns: 4
                //anchors.centerIn: parent

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 2
                    color: "#9aff92"
                    Text {
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                        text: qsTr("Сторона треугольника а")
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: "#ffffff"
                    TextInput {
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                        text: qsTr("")
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.rowSpan: 2
                    color: "#9aff92"
                }
                //
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 2
                    color: "#9aff92"

                    Text {
                        text: qsTr("Сторона треугольника b")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: "#ffffff"

                    TextInput {
                        text: qsTr("")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 2
                    color: "#9aff92"

                    Text {
                        text: qsTr("Сторона треугольника c")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                }
                //
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: "#ffffff"

                    TextInput {
                        text: qsTr("")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: "#363636"
                    Button {
                        anchors.fill: parent
                        text: "Вычеслить"
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    color: "#9aff92"
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: "#9aff92"

                    Text {
                        text: qsTr("Рузультат:")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: "#9aff92"
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "#ffffff"
                    Layout.columnSpan: 2

                    TextInput {
                        text: qsTr("")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 16
                    }
                }

            }
        }
    }
}
