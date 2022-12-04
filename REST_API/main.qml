import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Logic.js" as Logic

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("REST API")


    //    property string url: "http://127.0.0.1:5000/staff" // flask
    //    property string url2: "http://numbersapi.com/1..3,10" // NUMBERS json
    //    property string url3: "https://world.openfoodfacts.org/api/v0/product/737628064502.json" //Food
    //    property string url4: "https://api.scripture.api.bible/v1/bibles" //BIBLIA

    //    property string swagger: "https://petstore.swagger.io/v2/"

    //    // pet
    //    // post
    //    property string findByStatus: "pet/findByStatus?status="
    //    property string availableStatus: "available"
    //    property string pendingStatus: "pending"
    //    property string soldStatus: "sold"

    //    TextField {
    //        id: urlPath
    //        width: 2/3 * parent.width
    //        height: 50
    //        text: swagger
    //    }

    //    Button {
    //        width: 1/3 * parent.width
    //        height: 50
    //        anchors.left: urlPath.right
    //        text: "GO"

    //        onClicked: {

    //            const url = swagger + findByStatus + pendingStatus
    //            Logic.getData(url)
    //        }
    //    }

    //Style
    readonly property color bgColor: "#0C7B93"

    Page {
        anchors.fill: parent
        header: Rectangle {
            color: bgColor
            height: 1/5 * parent.height
            Row {
                anchors.fill: parent
                Rectangle {
                    width: 1/4 * parent.width
                    height: parent.height
                    color: bgColor
                    scale: 0.6
                    Rectangle {
                        anchors.centerIn: parent
                        anchors.fill: parent
                        anchors.margins: 20
                        radius: 10
                        color:"darkgrey"
                        border.width: 3
                        border.color: "grey"
                        Label {
                            anchors.centerIn: parent
                            text: "200"
                            font.pixelSize: 1/2 * parent.height//32
                            color: "green"
                            font.bold: true

                        }
                    }
                }
                Rectangle {
                    width: 1/2 * parent.width
                    height: parent.height
                    color: bgColor
                    Label {
                        anchors.centerIn: parent
                        text: "Шаурма Shop"
                        font.pixelSize: 1/3 * parent.height
                        font.bold: true
                    }
                }
                Rectangle {
                    width: 1/4 * parent.width
                    height: parent.height
                    color: bgColor
                    scale: 0.6
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0
                        Row{
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Rectangle{
                                width: 2/3 * parent.width
                                height:  parent.height
                                color: bgColor
                                Label {
                                    anchors.centerIn: parent
                                    text: "available"
                                    font.bold: true
                                    font.pixelSize: (1/2 * parent.height) + 5

                                }
                            }

                            CheckBox {
                                width: 1/3 * parent.width
                                checked: true
                                scale: 0.8

                            }
                        }
                        Row{
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Rectangle{
                                width: 2/3 * parent.width
                                height: parent.height
                                color: bgColor
                                Label {
                                    anchors.centerIn: parent
                                    text: "pending"
                                    font.bold: true
                                    font.pixelSize: (1/2 * parent.height) + 5

                                }
                            }
                            CheckBox {
                                width: 1/3* parent.width
                                checked: true
                                scale: 0.8
                            }
                        }
                        Row{
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Rectangle{
                                width: 2/3 * parent.width
                                height: parent.height
                                color: bgColor
                                Label {
                                    anchors.centerIn: parent
                                    text: "sold"
                                    font.bold: true
                                    font.pixelSize: (1/2 * parent.height) + 5

                                }
                            }
                            CheckBox {
                                width: 1/3 * parent.width
                                checked: true
                                scale: 0.8
                                //text: qsTr("First")
                            }
                        }


                    }

                }
            }
        } // header
        Rectangle {
            anchors.fill: parent
            color: bgColor
            Row {
                anchors.fill: parent
                Rectangle {
                    width: 1/4 * parent.width
                    height: parent.height
                    color: bgColor
                    scale: 0.9
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.topMargin: 30
                        anchors.bottomMargin: 30
                        spacing: 10
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: bgColor
                            Button {
                                width: parent.width
                                height: 1/2 * parent.height
                                anchors.centerIn: parent
                                background: Rectangle {
                                    radius: 15
                                    border.width: 3
                                    border.color: "grey"
                                    color: parent.pressed ?  Qt.darker("yellow") : parent.hovered? Qt.lighter("yellow") : "yellow"

                                    Text {
                                        anchors.centerIn: parent
                                        font.pointSize: 16
                                        font.bold: true
                                        text: "PRESS"
                                    }
                                }
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: bgColor
                            Button {
                                width: parent.width
                                height: 1/2 * parent.height
                                anchors.centerIn: parent
                                background: Rectangle {
                                    radius: 15
                                    border.width: 3
                                    border.color: "grey"
                                    color: parent.pressed ?  Qt.darker("yellow") : parent.hovered? Qt.lighter("yellow") : "yellow"

                                    Text {
                                        anchors.centerIn: parent
                                        font.pointSize: 16
                                        font.bold: true
                                        text: "PRESS"
                                    }
                                }
                            }
                        }
                    }
                }
                Rectangle {
                    width: 1/2 * parent.width
                    height: parent.height
                    color: bgColor
                    scale: 0.9
                    ColumnLayout {
                        anchors.fill: parent
                        Label {
                            Layout.alignment: Qt.AlignCenter
                            text: "name"
                            font.bold: true
                            font.pixelSize: 30
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: Qt.lighter(bgColor)
                            radius: 25
                            Row {
                                anchors.fill: parent
                                Rectangle {
                                    radius: 25
                                    height: parent.height
                                    width: 1/5 * parent.width
                                    color: Qt.lighter(bgColor)
                                    Label {
                                        anchors.centerIn: parent
                                        text: "<"
                                        font.pixelSize: 30
                                        font.bold: true
                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: console.log("LEFT")
                                        }

                                    }

                                }
                                Rectangle {
                                    height: parent.height
                                    width: 3/5 * parent.width
                                    color: Qt.lighter(bgColor)
                                }
                                Rectangle {
                                    radius: 25
                                    height: parent.height
                                    width: 1/5 * parent.width
                                    color: Qt.lighter(bgColor)
                                    Label {
                                        anchors.centerIn: parent
                                        text: ">"
                                        font.pixelSize: 30
                                        font.bold: true
                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: console.log("RIGHT")
                                        }

                                    }

                                }
                            }
                        }

                        Label {
                            Layout.alignment: Qt.AlignCenter
                            text: "id"
                            font.bold: true
                            font.pixelSize: 30
                        }
                    }
                } // center
                Rectangle {
                    width: 1/4 * parent.width
                    height: parent.height
                    color: bgColor
                    scale: 0.9
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.topMargin: 30
                        anchors.bottomMargin: 30
                        spacing: 10
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: bgColor
                            Button {
                                width: parent.width
                                height: 1/2 * parent.height
                                anchors.centerIn: parent
                                background: Rectangle {
                                    radius: 15
                                    border.width: 3
                                    border.color: "grey"
                                    color: parent.pressed ?  Qt.darker("yellow") : parent.hovered? Qt.lighter("yellow") : "yellow"

                                    Text {
                                        anchors.centerIn: parent
                                        font.pointSize: 16
                                        font.bold: true
                                        text: "PRESS"
                                    }
                                }
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: bgColor
                            Button {
                                width: parent.width
                                height: 1/2 * parent.height
                                anchors.centerIn: parent
                                background: Rectangle {
                                    radius: 15
                                    border.width: 3
                                    border.color: "grey"
                                    color: parent.pressed ?  Qt.darker("yellow") : parent.hovered? Qt.lighter("yellow") : "yellow"

                                    Text {
                                        anchors.centerIn: parent
                                        font.pointSize: 16
                                        font.bold: true
                                        text: "PRESS"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } // content
        footer: Rectangle {
            color: bgColor
            height: 1/5 * parent.height
            Rectangle {
                anchors.centerIn: parent
                width: parent.width
                height: 1/3 * parent.height
                color: "yellow"
                Label {
                    anchors.centerIn: parent
                    text: "Не одно животное не пострадало!  но это не точно!"
                    font.bold: true
                    font.pixelSize: 1/2 * parent.height
                }
            }
        }
    }

}
