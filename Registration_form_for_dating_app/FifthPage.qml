import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id: fifthPage
    property string leftButtonName: "left"
    property string rightButtonName: "right"
    signal leftButtonClicked()
    signal rightButtonClicked()

    anchors.fill: parent
    anchors.margins: 64
    radius: 20
    color: mainBubbleColor

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        spacing: 2


        Rectangle {
            Layout.alignment: Qt.AlignCenter

            Layout.fillHeight: true

            width: bubbleWidth
            radius: 15
            color: secondBubbleColor

            Text {
                id: country
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Возраст партнера " + slider.value
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            Slider {
                id: slider
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: country.bottom
                anchors.topMargin: 10
                width: parent.width * 0.9
                height: parent.height * 0.2
                from: 18
                to: 120
                stepSize: 1
                font.bold: true
                font.pixelSize: 24
                background: Rectangle {
                    color: componentColor
                }

            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            width: bubbleWidth
            radius: 15
            color: secondBubbleColor

            Text {
                id: sex
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Пол партнера"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: sex.bottom
                width: parent.width * 0.9
                height: parent.height * 4 / 10

                RadioButton {
                    Layout.alignment: Qt.AlignCenter
                    text: "<font color=\"" + Qt.lighter("dark blue") + "\"> M </font>"
                    font.bold: true
                    font.pixelSize: 24
                    background: Rectangle {
                        color: secondBubbleColor
                    }


                }

                RadioButton {
                    Layout.alignment: Qt.AlignCenter
                    text: "<font color=\"" + Qt.lighter("red") + "\"> Ж </font>"
                    font.bold: true
                    font.pixelSize: 24
                    background: Rectangle {
                        color: secondBubbleColor
                    }
                }
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            width: bubbleWidth
            radius: 15
            color: "transparent"
        }

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            width: bubbleWidth
            radius: 15
            color: "transparent"
        }

        DownButtons {}
    }
}
