import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "Logic.js" as Logic

Item {
    id: root
    anchors.fill: parent
    property alias login: loginField.text
    property alias password: passwordField.text

    Rectangle {
        width: 300
        height: 300
        anchors.centerIn: parent
        color: "grey"

        ColumnLayout{
            anchors.fill: parent
            Label {
                Layout.alignment: Qt.AlignCenter
                text: "Sing In"
                font.pixelSize: 24
            }

            TextField {
                id: loginField
                Layout.alignment: Qt.AlignCenter
                font.pixelSize: 20
                color: "grey"
                placeholderText: "Login"

            }

            TextField {
                id: passwordField
                Layout.alignment: Qt.AlignCenter
                font.pixelSize: 20
                color: "grey"
                placeholderText: "Password"
                echoMode: TextInput.Password
            }

            Button {
                Layout.alignment: Qt.AlignCenter
                text: "ENTER"

                onClicked: {
                    if(Logic.checkCreditals(login, password)){
                        print("SING_IN_OK");
                        root.destroy();
                    }
                    else
                        print("SING_IN_ERROR");
                }
            }
        }
    }
}
