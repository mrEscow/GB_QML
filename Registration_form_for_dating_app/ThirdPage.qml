import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id: thirdPage

    property string leftButtonName: "left"
    property string rightButtonName: "right"
    signal leftButtonClicked()
    signal rightButtonClicked()

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    width: {
        if(parent.width > 500) return parent.width * 0.5
        else return 250
    }
    height: parent.height * 0.7
    implicitWidth: 300
    radius: 20
    color: mainBubbleColor

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: parent.height * 0.03
        anchors.leftMargin: parent.width * 0.1
        anchors.rightMargin: parent.width * 0.1
        spacing: parent.height * 0.02


        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 15
            color: secondBubbleColor

            Text {
                id: education
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Образование"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            ComboBox {
                id: comboBox
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: education.bottom
                width: parent.width * 0.8
                height: parent.height * 4 / 10
                model:["Школа","Колледж","Бакалавр","Магистр","Доктор наук" ]
                delegate: ItemDelegate {
                    width: comboBox.width
                    contentItem: Rectangle {
                        anchors.fill: parent
                        color: componentColor
                        Text {
                            text: modelData
                            color: Qt.darker(buttonTextColor)
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: parent.height * 0.4
                            font.bold: true

                        }
                    }
                    highlighted: comboBox.highlightedIndex === index
                }

                font.bold: true
                font.pixelSize: parent.height * 0.2

                background: Rectangle {
                    color: componentColor
                }
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 15
            color: secondBubbleColor

            Text {
                id: hobby
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Хобби"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: hobby.bottom
                width: parent.width * 0.8
                height: parent.height * 4 / 10
                color: bgColor
                font.bold: true
                font.pixelSize: parent.height * 0.2
                background: Rectangle {
                    color: componentColor
                }
            }
        }



        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 15
            color: "transparent"
        }


        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 15
            color: "transparent"

        }

        DownButtons {}
    }
}
