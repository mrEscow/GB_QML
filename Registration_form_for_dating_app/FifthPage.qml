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
            Layout.preferredHeight: 2

            Text {
                id: country
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Возраст партнера "
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.15
                color: textColor
            }

            RowLayout {
                id: upLayout
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: country.bottom
                anchors.topMargin: 10
                width: parent.width * 0.9
                height: parent.height * 0.2

                Text {
                    id: upTextL
                    //Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredHeight: 1
                    font: country.font
                    color: textColor
                    text: "от "
                }

                Slider {
                    id: upSlider
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredHeight: 4
                    from: 18
                    to: downSlider.value
                    stepSize: 1
                    font.bold: true
                    font.pixelSize: 24

                    handle: Rectangle {
                        x: upSlider.visualPosition * (upSlider.width - width)
                        y: (upSlider.height - height) / 2
                        width: parent.width * 0.08
                        height: parent.width * 0.08
                        radius: height / 2
                        color: "gray"
                    }

                    background: Rectangle {
                        y: (upSlider.height - height) / 2
                        height: parent.height * 0.3
                        radius: height / 2
                        color: componentColor

                        Rectangle {
                            width: upSlider.visualPosition * parent.width
                            height: parent.height
                            color: Qt.darker(componentColor)
                            radius: height / 2
                        }
                    }
                }


                Text {
                    id: upTextR
                    Layout.fillHeight: true
                    Layout.preferredHeight: 1
                    font: country.font
                    color: textColor
                    text:  upSlider.value
                }
            }


            RowLayout {
                id: downLayout
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: upLayout.bottom
                anchors.topMargin: 10
                width: parent.width * 0.9
                height: parent.height * 0.2

                Text {
                    id: downTextL
                    Layout.fillHeight: true
                    Layout.preferredHeight: 1
                    font: country.font
                    color: textColor
                    text: "до "
                }

                Slider {
                    id: downSlider
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredHeight: 5
                    from: upSlider.value
                    to: 120
                    value: 120
                    stepSize: 1
                    font.bold: true
                    font.pixelSize: 24

                    handle: Rectangle {
                        x: downSlider.visualPosition * (downSlider.width - width)
                        y: (downSlider.height - height) / 2
                        width: parent.width * 0.08
                        height: parent.width * 0.08
                        radius: height / 2
                        color: "gray"
                    }

                    background: Rectangle {
                        y: (downSlider.height - height) / 2
                        height: parent.height * 0.3
                        radius: height / 2
                        color: componentColor

                        Rectangle {
                            width: downSlider.visualPosition * parent.width
                            height: parent.height
                            color: Qt.darker(componentColor)
                            radius: height / 2
                        }
                    }
                }


                Text {
                    id: downTextR
                    Layout.fillHeight: true
                    Layout.preferredHeight: 1
                    font: country.font
                    color: textColor
                    text:  downSlider.value
                }
            }
        }

        ////////////////////////////////////////////////
        Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            radius: 15
            color: secondBubbleColor
            Layout.preferredHeight: 1

            Text {
                id: gender
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Пол партнера"
                font.bold: true
                font.italic: true
                font.pixelSize: parent.height * 0.3
                color: textColor
            }

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: gender.bottom
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
                        color: componentColor
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
                        color: componentColor
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
            Layout.preferredHeight: 1
        }

        DownButtons {
            Layout.preferredHeight: 1
        }
    }

}
