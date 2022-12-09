import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.qmlmodels 1.0
import QtQuick.LocalStorage 2.15 as SQL
import QtQuick.Controls 2.12


import "qrc:/JS/DBFunctions.js" as DBFunctions


//    Добавьте работу с БД, сделайте переключение между несколькими таблицами в БД, выбор
//    таблицы сделайте в виде ComboBox, добавьте возможность редактирования значений в
//    таблице.


Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("SQLite")

    property int cellHorizontalSpacing: 10
    readonly property int tableDelegatHeight: 50
    property int currentIndex
    property var rowObj

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

    function getRowIndex(x){
        for(let ix = 0; ix < tableModel.rowCount; ix++){
            if(x >= (tableDelegatHeight * ix)  &&  x < tableDelegatHeight * (1+ix)) return ix
        }
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
            height: tableModel.rowCount * tableDelegatHeight
            columnSpacing: 1
            rowSpacing: 1
            model: tableModel
            clip: true



            delegate: Rectangle {
                id: tableDelegat

                implicitWidth: Math.max( 100, /*left*/ cellHorizontalSpacing + innerText.width + /*right*/ cellHorizontalSpacing )
                implicitHeight: tableDelegatHeight
                border.width: 1

                Text {
                    id: innerText
                    text: display
                    anchors.centerIn: parent
                }
            }

            MouseArea {
                id: mouse
                anchors.fill: parent

                onClicked: {
                    currentIndex = getRowIndex(mouse.y)
                    rowObj = tableModel.getRow(currentIndex)
                    updateDialog.open()
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


    Dialog {
        id: updateDialog
        anchors.centerIn: parent
        title: "Update person"
        standardButtons: Dialog.Ok | Dialog.Cancel
        Column {
            anchors.fill: parent
            spacing: 5
            TextField {
                id: updateFirstName
                text: rowObj.first_name
            }
            TextField {
                id: updateLastName
                text: rowObj.last_name
            }
            TextField {
                id: updateEmail
                text: rowObj.email
            }
            TextField {
                id: updatePhone
                text: rowObj.phone
            }
        }
        onAccepted: {

            rowObj.first_name = updateFirstName.text
            rowObj.last_name = updateLastName.text
            rowObj.email = updateEmail.text
            rowObj.phone = updatePhone.text

            try {
                db.transaction((tx) => { DBFunctions.updateContact(tx, rowObj, currentIndex + 1)})

                tableModel.setRow(currentIndex, {
                                      id: currentIndex,
                                      first_name: rowObj.first_name,
                                      last_name: rowObj.last_name,
                                      email: rowObj.email,
                                      phone: rowObj.phone
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
