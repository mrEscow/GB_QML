import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
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

        // Name
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true

            width: bubbleWidth
            radius: 15
            color: secondBubbleColor

            Text {
                id: name
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Ваше имя"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: name.bottom
                width: parent.width * 0.9
                height: parent.height * 4 / 10
                color: bgColor
                font.bold: true
                font.pixelSize: 24
                background: Rectangle {
                    color: componentColor
                }
            }
        }

        // Email
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            width: bubbleWidth
            radius: 15
            color: secondBubbleColor

            Text {
                id: email
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Ваша почта"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: email.bottom
                width: parent.width * 0.9
                height: parent.height * 4 / 10
                color: bgColor
                font.bold: true
                font.pixelSize: 24
                background: Rectangle {
                    color: componentColor
                }
            }
        }

        // Пароль
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            width: bubbleWidth
            radius: 15
            color: secondBubbleColor

            Text {
                id: password
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Пароль"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: password.bottom
                width: parent.width * 0.9
                height: parent.height * 4 / 10
                color: bgColor
                font.bold: true
                font.pixelSize: 24
                background: Rectangle {
                    color: componentColor
                }
            }
        }

        // Пароль2
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            width: bubbleWidth
            radius: 15
            color: secondBubbleColor

            Text {
                id: password2
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Пароль повторно"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            TextField {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: password2.bottom
                width: parent.width * 0.9
                height: parent.height * 4 / 10
                color: bgColor
                font.bold: true
                font.pixelSize: 24
                background: Rectangle {
                    color: componentColor
                }
            }
        }

        // Кнопки
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillHeight: true
            width: bubbleWidth
            radius: 15
            color: secondBubbleColor

            Rectangle {
                id: bottonsAria
                anchors.fill: parent
                color: secondBubbleColor
                anchors.margins: 15
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
                            font.pixelSize: parent.height / 3
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
                            font.pixelSize: parent.height / 3
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
                    width: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: bottonsAria.height
                    color: secondBubbleColor
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.bold: true
                        font.pixelSize: parent.height / 2
                        color: textColor
                        text: "< >"
                    }
                }
            }
        }
    }
}
