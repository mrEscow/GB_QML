import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3 // для MessageDialog
import "Logic.js" as Logic

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("REST API")

    property int responseStatus
    property color responseStatusColor: "green"
    property string nameLabel

    readonly property string defaultImag: "https://flyclipart.com/thumb2/clipart-of-behind-a-dog-collection-272804.png"
    readonly property string defaultImag2: "https://gas-kvas.com/uploads/posts/2022-06/1655834202_30-gas-kvas-com-p-foto-multyashnoi-sobaki-31.png"

    property string swagger: "https://petstore.swagger.io/v2/"

    //    // pet
    //    // post
    property string findByStatus: "pet/findByStatus?"
    property string availableStatus: "available"
    property string pendingStatus: "pending"
    property string soldStatus: "sold"

    //Style
    readonly property color bgColor: "#0C7B93"
    color: "yellow"

    ListModel{
        id: listModel
        ListElement {
            name: "Alice"
            uid: 123
            stat: "qwerty"
            photoUrl: "https://cdn.fishki.net/upload/post/2016/12/02/2153008/chihuahua-na-lugu.jpg"
        }
        ListElement {
            name: "Bob"
            uid: 1234
            status: "qwertywer"
        }
        ListElement {
            name: "Cristy"
            uid: 12345
            status: "qwertywer"
        }
    }
    Page {
        anchors.fill: parent
        scale: 0.98
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
                            text: responseStatus
                            font.pixelSize: 1/2 * parent.height//32
                            color: responseStatusColor
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
                                id: availableCheckBox
                                width: 1/3 * parent.width
                                //checked: true
                                scale: 0.8
                                onClicked: Logic.getPets()
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
                                id: pendingCheckBox
                                width: 1/3* parent.width
                                checked: true
                                scale: 0.8
                                onClicked: Logic.getPets()
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
                                id: soldCheckBox
                                width: 1/3 * parent.width
                                //checked: true
                                scale: 0.8
                                onClicked: Logic.getPets()
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
                                    color: parent.pressed ?  Qt.darker("green") : parent.hovered? Qt.lighter("green") : "green"

                                    Text {
                                        anchors.centerIn: parent
                                        font.pointSize: 16
                                        font.bold: true
                                        text: "ЗАКАЗАТЬ"
                                    }
                                }
                                onClicked: {
                                    dialog.open()
                                    console.log("CLICK:ЗАКАЗАТЬ")
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
                                    color: parent.pressed ?  Qt.darker("blue") : parent.hovered? Qt.lighter("blue") : "blue"

                                    Text {
                                        anchors.centerIn: parent
                                        font.pointSize: 16
                                        font.bold: true
                                        text: "НАЙТИ ПО ID"
                                    }
                                }
                                onClicked: {
                                    dialog2.open()
                                    console.log("CLICK:НАЙТИ ПО ID")
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
                            id: labelName
                            Layout.alignment: Qt.AlignCenter
                            text: listModel.get(swiper.currentIndex).name === undefined ? "error" : listModel.get(swiper.currentIndex).name
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
                                            onClicked: {
                                                if(swiper.currentIndex == 0)
                                                    swiper.currentIndex = listModel.count - 1
                                                else
                                                    swiper.currentIndex--
                                                console.log("LEFT index:", swiper.currentIndex)
                                            }
                                        }
                                    }
                                }
                                Rectangle {
                                    id: viewAria
                                    height: parent.height
                                    width: 3/5 * parent.width
                                    color: Qt.lighter(bgColor)

                                    ListView {
                                        id: swiper
                                        anchors.fill: parent
                                        model: listModel
                                        clip: true
                                        spacing: 20
                                        snapMode: ListView.SnapOneItem
                                        orientation: ListView.Horizontal
                                        delegate: Rectangle{
                                            width: swiper.width
                                            height: swiper.height
                                            radius: height / 2
                                            scale: 0.8
                                            color: Qt.lighter(Qt.lighter(bgColor))

                                            Image {
                                              anchors.fill: parent
                                              id: petImage
                                              source: photoUrl === "string" ? defaultImag : photoUrl === "nulla" ? defaultImag2 : photoUrl
                                              fillMode: Image.PreserveAspectCrop
                                            }

                                            Label {
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                y: parent.height
                                                text: status
                                                font.bold: true
                                                font.pixelSize: 24
                                                color: "white"
                                            }

                                        }
                                        onCurrentIndexChanged: {
                                            labelName.text = listModel.get(currentIndex).name
                                            labelId.text = "id:" + listModel.get(currentIndex).id

                                            let photo = listModel.get(currentIndex).photoUrl
                                            console.log("CurrentIndexChanged:",String(photo))
                                        }

                                    }

                                } // center center
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
                                            onClicked: {

                                                if(swiper.currentIndex == listModel.count - 1)
                                                    swiper.currentIndex = 0
                                                else
                                                    swiper.currentIndex++
                                                console.log("RIGHT index:", swiper.currentIndex)
                                            }
                                        }

                                    }

                                }
                            }
                        }

                        Label {
                            id: labelId
                            Layout.alignment: Qt.AlignCenter
                            text: "id:"+listModel.get(swiper.currentIndex).id
                            font.bold: true
                            font.pixelSize: 24
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
                                        text: "+КАРТИНКА"
                                    }
                                }
                                onClicked: {
                                    dialog3.open()
                                    console.log("CLICK:+КАРТИНКА")
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
                                    color: parent.pressed ?  Qt.darker("red") : parent.hovered? Qt.lighter("red") : "red"
                                    Text {
                                        anchors.centerIn: parent
                                        font.pointSize: 16
                                        font.bold: true
                                        text: "СЪЕСТЬ"
                                    }
                                }
                                onClicked: {
                                    console.log("CLICK:СЪЕСТЬ")
                                    const id = listModel.get(swiper.currentIndex).id
                                    print(id)
                                    Logic.deletePet(id)
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

    Component.onCompleted: {
        //const url = swagger + findByStatus + pendingStatus
        Logic.getPets()
    }

    Dialog {
        id: dialog
        title: "Кого изволите поймать?"

        standardButtons: Dialog.Ok | Dialog.Canscel
        Column {
            anchors.fill: parent
            Label {
                text: "Кличка животного:"
            }

            TextField {
                id: dialogName

            }
            Label {
                text: "Нужно присвоить ID:"
            }

            TextField {
                id: dialogId
                validator: IntValidator {
                        bottom: 1
                        top: 1000000000
                    }
            }

            Label {
                text: "Как поступим?"
            }

            ComboBox {
                id: dialogStatus
                model: ["Доступный","Забронированый","На_продажу"]

            }

            Label {
                text: "url картинки"
            }

            TextField {
                id: dialogImage
            }
        }

        onAccepted: {
            Logic.addPet()
        }
    }

    Dialog {
        id: dialog2
        title: "Кого изволите найти по id?"

        standardButtons: Dialog.Ok | Dialog.Canscel
        Column {
            anchors.fill: parent
            TextField {
                id: dialogId2
                validator: IntValidator {
                        bottom: 1
                        top: 1000000000
                    }
            }

        }

        onAccepted: {
            Logic.findPetByID(dialogId2.text)
        }
    }

    Dialog {
        id: dialog3
        title: "Поменять картинку?"

        standardButtons: Dialog.Ok | Dialog.Canscel
        Column {
            anchors.fill: parent
            TextField {
                id: dialogId3
                validator: IntValidator {
                        bottom: 1
                        top: 1000000000
                    }
                text: listModel.get(swiper.currentIndex).id

            }
            Label {
                text: "url картинки"
            }

            TextField {
                id: dialogImage2
                text: ""
            }

        }

        onAccepted: {
            Logic.updateImage(dialogId3.text)
            dialogId3.text = " "
        }
    }

    MessageDialog {
        id: messageDialog
    }


}
