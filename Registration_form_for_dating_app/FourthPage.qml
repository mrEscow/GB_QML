import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    property alias userAbout: textAbout.text

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
        spacing: parent.height * 0.04

        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight:  true
            Layout.preferredHeight: 4
            radius: 15
            color: secondBubbleColor

            Text {
                id: about
                anchors.horizontalCenter: parent.horizontalCenter
                text: "О себе"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.1
                color: textColor
            }
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: about.bottom
                width: parent.width * 0.9
                height: parent.height * 8 / 10
                color: componentColor

                TextInput  {
                    id: textAbout
                    anchors.fill: parent
                    color: bgColor
                    font.bold: true
                    font.pixelSize: parent.height * 0.08
                    wrapMode:  Text.WordWrap
                }
            }
        }

        DownButtons {
            id: buttons
            Layout.preferredHeight: 1
        }
    }
}
