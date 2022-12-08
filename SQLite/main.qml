import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.qmlmodels 1.0
import QtQuick.LocalStorage 2.15 as SQL
import QtQuick.Controls 2.12


import "qrc:/JS/DBFunctions.js" as DBFunctions

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("SQLite")

    property int cellHorizontalSpacing: 10

    property var db

    TableModel {
        id: tableModel
        TableModelColumn { display: "id" }
        TableModelColumn { display: "first_name" }
        TableModelColumn { display: "last_name" }
        TableModelColumn { display: "email" }
        TableModelColumn { display: "phone" }
        rows: []


    }

    Column {
        anchors.fill: parent
        ComboBox {
            width: 200
            height: 50

        }

        TableView {
            id: table
            //anchors.fill: parent
            width: mainWindow.width
            height: tableModel.rowCount * 50
            columnSpacing: 1
            rowSpacing: 1
            model: tableModel
            clip: true



            delegate: Rectangle {
                //required property bool selected
                //required property bool current

                implicitWidth: Math.max( 100, /*left*/ cellHorizontalSpacing + innerText.width + /*right*/ cellHorizontalSpacing )
                implicitHeight: 50
                border.width: 1

                //color: selected ? "blue" : "lightgray"

                Text {
                    id: innerText
                    text: display
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: console.log("tab:",   )
                }
            }
        }

    }
    Dialog {
        id: dialog
        anchors.centerIn: parent
        title: "Add person"
        standardButtons: Dialog.Ok | Dialog.Cancel
        Column {
            anchors.fill: parent
            spacing: 5
            TextField {
                id: firstName
                placeholderText: "Имя"
            }
            TextField {
                id: lastName
                placeholderText: "Фамилия"
            }
            TextField {
                id: email
                placeholderText: "E-mail"
            }
            TextField {
                id: phone
                placeholderText: "Номер телефона"
            }
        }
        onAccepted: {
            try {
                db.transaction((tx) => {
                                   let resObj = DBFunctions.addContact(tx, firstName.text,
                                                                       lastName.text,
                                                                       email.text,
                                                                       phone.text);
                                   if (resObj.rowsAffected !== 0) {
                                       tableModel.appendRow({
                                                                id: resObj.insertId,
                                                                first_name: firstName.text,
                                                                last_name: lastName.text,
                                                                email: email.text,
                                                                phone: phone.text
                                                            })
                                   }
                               })
            } catch (err) {
                console.log("Error creating or updating table in database: " + err)
            }
        }
    }
    Button {
        id: button
        text: "Добавить человека"
        width: parent.width
        height: 50
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: dialog.open()
    }


    Component.onCompleted: {
        var data_array = ListModel

        db = SQL.LocalStorage.openDatabaseSync("DBExample", "1.0", "Пример локальной базы данных", 1000)


        try {
            db.transaction(DBFunctions.createSimpleTable);
            //            db.transaction((tx) => {
            //                               DBFunctions.addContact(tx, "Иванов", "Иван", "ivanoviv2182@mail.ru", "+7(988)37333112")
            //                               DBFunctions.addContact(tx, "Заварнов", "Владимир", "zavlad@mail.ru", "+7(977)98373331")
            //                               DBFunctions.addContact(tx, "Говорун", "Максим", "landlord2000@mail.ru", "+7(977)3311111")
            //                           })

            //            db.transaction((tx) => {
            //                               DBFunctions.addContact(tx, "Пучков", "Константин", "puchok@mail.ru", "+7(933)1234123")
            //                               DBFunctions.addContact(tx, "Ниливкин", "Сергей", "nalivaickin@mail.ru", "+7(933)3456873")
            //                               DBFunctions.addContact(tx, "Молчун", "Дмитрий", "molchyn@mail.ru", "+7(933)9876142")
            //                           })
            db.transaction((tx) => { DBFunctions.readContacts(tx, table.model) })

        } catch (err) {
            console.log("Error creating or updating table in database: " + err)
        }
    }
}
