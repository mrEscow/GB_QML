import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 640
    //minimumWidth: 450
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

    property real bubbleWidth: 250

    function printUser(user){
        console.log(user.id);
        console.log(user.mail);
        console.log(user.password);

        console.log(user.userDate.name);
        console.log(user.userDate.age);
        console.log(user.userDate.gender);
        console.log(user.userDate.country);
        console.log(user.userDate.sity);
        console.log(user.userDate.about);

        console.log(user.userDate.preferred.gender);
        console.log(user.userDate.preferred.minAge);
        console.log(user.userDate.preferred.maxAge);
    }

    function createUser(){
        var JsonString =
        '{
            "id": "1",
            "mail": "name@mail.ru",
            "password": "password",
            "userDate":
            {
              "name": "name",
              "age": "18",
              "gender": "gender",
              "country": "country",
              "sity": "sity",
              "about": "about",
              "preferred":
                {
                    "gender": "gender",
                    "minAge": "18",
                    "maxAge": "120"
                }
            }
        }';

        var user = JSON.parse(JsonString);

        printUser(user);
    }

    Component.onCompleted: createUser()

    Rectangle {
        anchors.fill: parent
        color: bgColor

        Text {
            id: label
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Регистрация"
            font.bold: true
            font.italic: true
            font.pixelSize: parent.width * 0.06
            color: textColor
        }

        StackView {
            id: stackView
            anchors.fill: parent
            initialItem: firstPage
        }

        FirstPage {
            id: firstPage
            visible: false
            leftButtonName: "Выход   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                close();
            }
            onRightButtonClicked: {
                stackView.push(secondPage)
            }
        }

        SecondPage {
            id: secondPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                stackView.push(thirdPage)
            }
        }

        ThirdPage {
            id: thirdPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                stackView.push(fourthPage)
            }
        }

        FourthPage {
            id: fourthPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                stackView.push(fifthPage)
            }
        }

        FifthPage {
            id: fifthPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Продолжить"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                stackView.push(endPage)
            }
        }

        EndPage {
            id: endPage
            visible: false
            leftButtonName: "Вернуться   "
            rightButtonName: " Зарегистрироваться"
            onLeftButtonClicked: {
                stackView.pop()
            }
            onRightButtonClicked: {
                stackView.pop(null)
            }
        }


    }
}
