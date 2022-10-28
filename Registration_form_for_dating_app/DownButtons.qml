import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    Layout.alignment: Qt.AlignCenter
    Layout.fillWidth: true
    Layout.fillHeight: true
    radius: 15
    color: secondBubbleColor

    Rectangle {
        id: bottonsAria
        anchors.fill: parent
        color: secondBubbleColor
        anchors.margins: parent.height * 0.2
        radius: 10

        Row {
            anchors.fill: parent
            Rectangle {
                width: bottonsAria.width / 2
                height: bottonsAria.height
                radius: bottonsAria.radius
                color: buttonsColor
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: parent.height / 5
                    color: buttonTextColor
                    text: leftButtonName + "   "
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: leftButtonClicked()
                }
            }

            Rectangle {
                width: bottonsAria.width / 2
                height: bottonsAria.height
                radius: bottonsAria.radius
                color: buttonsColor
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: parent.height / 5
                    color: buttonTextColor
                    text: "   " + rightButtonName
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: rightButtonClicked()
                }
            }
        }
        Rectangle {
            width: parent.width * 0.1
            anchors.horizontalCenter: parent.horizontalCenter
            height: bottonsAria.height
            color: secondBubbleColor
            MouseArea {
                anchors.fill: parent
            }
        }
    }
}
