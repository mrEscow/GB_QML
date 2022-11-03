import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id:window
    width: 640
    minimumWidth: 350
    height: 480
    minimumHeight: 350
    visible: true
    title: qsTr("States Transitions Animation")
    color: "grey"

    Item {
        id: root
        width: 300
        height: 300
        anchors.centerIn: parent
        Rectangle {
            id: loginForm
            anchors.fill: parent
            radius: 10
            color: "lightblue"
            opacity: 1
            transform: Rotation{
                id: formTransform
                origin.x: loginForm.width / 2
                origin.y: loginForm.height / 2;
                axis { x: 0; y: 1; z: 0 }
                angle: 0
            }

            ColumnLayout {
                anchors.fill: parent

                Label {
                    Layout.alignment: Qt.AlignCenter
                    text: "Login"
                    font.bold: true
                    font.pixelSize: 18

                }

                TextField {
                    Layout.alignment: Qt.AlignCenter
                    width: 250
                    height: 50
                    placeholderText: "email"
                }

                TextField {
                    Layout.alignment: Qt.AlignCenter
                    width: 250
                    height: 50
                    placeholderText: "password"
                }

                Button  {
                    id: loginInButton
                    Layout.alignment: Qt.AlignCenter
                    width: 250
                    height: 50
                    text: "LoginIn"
                    onClicked: {console.log(root.state); root.state = "inputOk"; console.log(root.state)}
                }
            } // ColumnLayout
        } // loginForm

        Rectangle {
            id: inApp
            width: 300
            height: 300
            radius: 10
            anchors.centerIn: parent
            color: "lightblue"
            opacity: 0
            transform: Rotation{
                id: inApptransform
                origin.x: loginForm.width / 2
                origin.y: loginForm.height / 2;
                axis { x: 0; y: 1; z: 0 }
                angle: 270
            }

            Timer {
                id: timer
                interval : 2500
                onTriggered:  {console.log(root.state); root.state = "SearchStop"; console.log(root.state)}
            }

            ColumnLayout {
                anchors.fill: parent

                Label {
                    Layout.alignment: Qt.AlignCenter
                    text: "Welcom"
                    font.bold: true
                    font.pixelSize: 18
                }

                Label {
                    id: infoLabel
                    Layout.alignment: Qt.AlignCenter
                    text: ""
                    font.bold: true
                    font.pixelSize: 18
                }

                BusyIndicator {
                    id:busyIndicator
                    Layout.alignment: Qt.AlignCenter
                    width: 250
                    height: 50
                    running: false
                }

                Button  {
                    id: searchButton
                    Layout.alignment: Qt.AlignCenter
                    width: 250
                    height: 50
                    text: "Search"
                    onClicked: {console.log(root.state); root.state = "SearchGo"; console.log(root.state)}
                }
            } // ColumnLayout
        } // inApp

        states: [
            State {
                name: "inputOk"
                PropertyChanges { target: formTransform; angle: 90 }
                PropertyChanges { target: inApptransform; angle: 360 }
                PropertyChanges { target: loginForm; opacity: 0 }
                PropertyChanges { target: inApp; opacity: 1 }
                PropertyChanges { target: loginInButton; enabled: false }
            },
            State {
                name: "SearchGo"
                PropertyChanges { target: loginForm; opacity: 0 }
                PropertyChanges { target: inApp; opacity: 0.7 }
                PropertyChanges { target: inApptransform; angle: 360 }
                PropertyChanges { target: loginInButton; enabled: false }
                PropertyChanges { target: busyIndicator; running: true }
                PropertyChanges { target: searchButton; enabled: false }
                PropertyChanges { target: timer; running: true }
            },
            State {
                name: "SearchStop"
                PropertyChanges { target: loginForm; opacity: 0 }
                PropertyChanges { target: inApp; opacity: 1 }
                PropertyChanges { target: inApptransform; angle: 360 }
                PropertyChanges { target: loginInButton; enabled: false }
                PropertyChanges { target: busyIndicator; running: false }
                PropertyChanges { target: searchButton; enabled: true }
                PropertyChanges { target: timer; running: false }
                PropertyChanges { target: infoLabel; text: "OK" }
            }
        ] // states

        transitions: [ Transition {
                to: "inputOk"
                SequentialAnimation {
                    PropertyAnimation { target: formTransform; property: "angle"; duration: 1000 }
                    PropertyAnimation {target: inApptransform; property: "angle"; duration: 1000 }
                }
                SequentialAnimation {
                    PropertyAnimation { target: loginForm; property: "opacity"; duration: 1000 }
                    PropertyAnimation { target: inApp; property: "opacity"; duration: 1000 }
                }
            }, Transition {
                from: "inputOk"
                to: "SearchGo"
                PropertyAnimation { target: inApp; property: "opacity"; duration: 300 }
            }, Transition {
                from: "SearchGo"
                to: "SearchStop"
                PropertyAnimation { target: inApp; property: "opacity"; duration: 200 }
            }
        ] // transitions
    } // root
} // window
