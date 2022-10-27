import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 400
    height: 600
    visible: true
    title: qsTr("Area_of_a_triangle_Heron")

    readonly property color bgColor: "#9aff92"

    property int textPixels: {
        if(width===700) return 28;
        else if (width<700 && width>=600) return 25;
        else if (width<600 && width>=500) return 21;
        else if (width<500 && width>=320) return 16;
        else if (width<320 && width>=200) return 12;
    }

    color: bgColor

    function calculate(){
        var p = (Number(a.text) + Number(b.text) + Number(c.text)) / 2;
        var s = Math.sqrt (p * ((p - Number(a.text)) * (p - Number(b.text)) * (p - Number(c.text))));
        result.text = s;
    }

    ColumnLayout {
        visible: true
        anchors.fill: parent
        anchors.margins: 15
        scale: 0.9
        transformOrigin: Item.Center
        clip: false

        Rectangle {
            id: labelRectangle
            width: 200
            height: 200
            color: bgColor
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                verticalAlignment: Text.AlignVCenter
                text: "Рассчитать площадь по формуле Герона"
                font.pixelSize: textPixels * 2
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                Layout.fillWidth: false
                Layout.fillHeight: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }
        }
        Rectangle {
            id: rectangle
            width: 200
            height: 200
            color: bgColor
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
            height: 300
            color: bgColor
            Layout.fillHeight: true
            Layout.fillWidth: true


            GridLayout {
                id: grid
                anchors.fill: parent
                columns: 4

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 4
                    color: bgColor
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 2
                    color: bgColor
                    Text {
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: textPixels
                        text: qsTr("Сторона а")
                    }
                }
                Rectangle {

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Layout.columnSpan: 1
                    color: "#ffffff"
                    TextField  {
                        id: a
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: textPixels
                        text: qsTr("")
                        validator: IntValidator {
                            bottom: 1
                            top: 100
                        }
                        inputMethodHints: Qt.ImhDigitsOnly

                        Keys.onEnterPressed: calculate()
                        Keys.onReturnPressed: calculate()

                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: bgColor
                }
                //
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 2
                    color: bgColor

                    Text {
                        text: qsTr("Сторона b")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: textPixels
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: "#ffffff"

                    TextField  {
                        id: b
                        text: qsTr("")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: textPixels
                        inputMethodHints: Qt.ImhDigitsOnly
                        validator: IntValidator {
                            bottom: 1
                            top: 100
                        }

                        Keys.onEnterPressed: calculate()
                        Keys.onReturnPressed: calculate()
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: bgColor
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 2
                    color: bgColor

                    Text {
                        text: qsTr("Сторона c")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: textPixels
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: "#ffffff"

                    TextField  {
                        id: c
                        text: qsTr("")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: textPixels
                        inputMethodHints: Qt.ImhDigitsOnly
                        validator: IntValidator {
                            bottom: 1
                            top: 100
                        }

                        Keys.onEnterPressed: calculate()
                        Keys.onReturnPressed: calculate()
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
                        onClicked: calculate()
                    }
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 3
                    color: bgColor
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: bgColor
                }
            }
        }

        Rectangle {
            id: rectangle2
            width: 200
            height: 60
            color: bgColor
            Layout.fillWidth: true
            Layout.fillHeight: true


            RowLayout {
                id: rowLayout
                anchors.right: parent.right
                anchors.fill: parent
                anchors.rightMargin: 0

                Rectangle {
                    height: 50
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: 1
                    color: bgColor

                    Text {
                        text: qsTr("Рузультат:")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: textPixels
                    }
                }

                Rectangle {
                    height: 50
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "#ffffff"
                    clip: false
                    Layout.columnSpan: 2

                    TextInput {
                        id: result
                        text: qsTr("")
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: textPixels
                        readOnly: true
                    }
                }
            }

        }
    }
}
