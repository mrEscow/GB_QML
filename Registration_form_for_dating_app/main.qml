import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Registration form")

    readonly property color bgColor: "#303a52"
    readonly property color mainBubbleColor: "#574b90"
    readonly property color secondBubbleColor: "#4B99A0"
    readonly property color componentColor: "#85B4B7"
    readonly property color textColor: "#fc85ae"
    readonly property color buttonsColor: "#5FBEC4"
    readonly property color buttonTextColor: "#466F72"

    Rectangle {
        anchors.fill: parent
        color: bgColor

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Регистрация"
            font.bold: true
            font.italic: true
            font.pixelSize: 48
            color: textColor
        }

        Rectangle {
            id: mainBubble
            anchors.fill: parent
            anchors.margins: 64
            radius: 20
            color: mainBubbleColor

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 2

                // Name
                Rectangle {
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillHeight: true
                    width: 300
                    radius: 15
                    color: secondBubbleColor

                    Text {
                        id: name
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Ваше имя"
                        font.bold: true
                        font.italic: true
                        font.pixelSize: parent.height * 1 / 3
                        color: textColor
                    }

                    TextField {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: name.bottom
                        width: 250
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
                    width: 300
                    radius: 15
                    color: secondBubbleColor

                    Text {
                        id: email
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Ваша почта"
                        font.bold: true
                        font.italic: true
                        font.pixelSize: parent.height * 1 / 3
                        color: textColor
                    }

                    TextField {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: email.bottom
                        width: 250
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
                    width: 300
                    radius: 15
                    color: secondBubbleColor

                    Text {
                        id: password
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Пароль"
                        font.bold: true
                        font.italic: true
                        font.pixelSize: parent.height * 1 / 3
                        color: textColor
                    }

                    TextField {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: password.bottom
                        width: 250
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
                    width: 300
                    radius: 15
                    color: secondBubbleColor

                    Text {
                        id: password2
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Пароль повторно"
                        font.bold: true
                        font.italic: true
                        font.pixelSize: parent.height * 1 / 3
                        color: textColor
                    }

                    TextField {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: password2.bottom
                        width: 250
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
                    width: 300
                    radius: 15
                    color: secondBubbleColor

                    Rectangle {
                        id: bottonsAria
                        anchors.fill: parent
                        color: secondBubbleColor
                        anchors.margins: 15
                        radius: 15

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
                                    text: "  " + "Продолжить"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: console.log("Clicked <<<")
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
                                    text: "  " + "Продолжить"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: console.log("Clicked >>>")
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
    }
}
