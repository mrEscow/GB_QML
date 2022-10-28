import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    property string leftButtonName: "left"
    property string rightButtonName: "right"
    signal leftButtonClicked()
    signal rightButtonClicked()

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    width: {
        if(parent.width > 400) return parent.width * 0.6
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
                id: age
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Ваш возраст " + slider.value
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            Slider {
                id: slider

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: age.bottom
                anchors.topMargin: 10
                width: parent.width * 0.9
                height: parent.height * 0.3
                from: 18
                to: 120
                stepSize: 1
                font.bold: true
                font.pixelSize: 24

                handle: Rectangle {
                    id: handleId
                    x: slider.visualPosition * (slider.width - width)
                    y: (slider.height - height) / 2
                    width: parent.width * 0.05
                    height: parent.width * 0.05
                    radius: (parent.width * 0.05) / 2
                    color: "gray"
                }
                background: Rectangle {
                    y: (slider.height - height) / 2
                    height: parent.height * 0.3
                    radius: height / 2
                    color: componentColor

                    Rectangle {
                        width: slider.visualPosition * parent.width
                        height: parent.height
                        color: Qt.darker(componentColor)
                        radius: height / 2
                    }
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
                id: sex
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Ваш пол"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: sex.bottom
                anchors.topMargin: 5
                width: parent.width * 0.9
                height: parent.height * 4 / 10

                RadioButton {
                    id: radioButtonL
                    Layout.alignment: Qt.AlignRight
                    Layout.fillHeight: true
                    implicitHeight:15
                    Layout.minimumHeight: 15
                    text: "<font color=\"" + Qt.lighter("dark blue") + "\"> M</font>"
                    font.bold: true
                    font.pixelSize: parent.height * 0.7
                    background: Rectangle {
                        color: secondBubbleColor
                    }
                    indicator: Rectangle {
                        height: parent.height * 0.9
                        width: height
                        x: radioButtonL.leftPadding
                        y: parent.height / 2 - height / 2
                        radius: width / 2
                        border.color: radioButtonL.down ? "gray" : "gray"

                        Rectangle {
                            width: parent.width * 0.9
                            height: parent.height * 0.9
                            x: parent.width / 2 - width / 2
                            y: parent.height / 2 - height / 2
                            radius: width / 2
                            color: radioButtonL.down ? "gray" : "gray"
                            visible: radioButtonL.checked
                        }
                    }

                }

                RadioButton {
                    id: radioButtonR
                    Layout.alignment: Qt.AlignLeft
                    implicitHeight:15
                    Layout.minimumHeight: 15
                    Layout.fillHeight: true
                    text: "<font color=\"" + Qt.lighter("red") + "\"> Ж</font>"
                    font.bold: true
                    font.pixelSize: parent.height * 0.7
                    background: Rectangle {
                        color: secondBubbleColor
                    }
                    indicator: Rectangle {
                        height: parent.height * 0.9
                        width: height
                        x: radioButtonR.leftPadding
                        y: parent.height / 2 - height / 2
                        radius: width / 2
                        border.color: radioButtonR.down ? "gray" : "gray"

                        Rectangle {
                            width: parent.width * 0.9
                            height: parent.height * 0.9
                            x: parent.width / 2 - width / 2
                            y: parent.height / 2 - height / 2
                            radius: width / 2
                            color: radioButtonR.down ? "gray" : "gray"
                            visible: radioButtonR.checked
                        }
                    }
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

        // Кнопки
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            //width: bubbleWidth
            radius: 15
            color: secondBubbleColor

            Rectangle {
                id: bottonsAria
                anchors.fill: parent
                color: secondBubbleColor
                anchors.margins: parent.height * 0.1
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
    }
}
