// Сделайте несколько страниц приложения —
// форму входа можно взять из первогопрактического задания.
// При введении правильного пароля обязательно удалите страницу
// формы входа и создайте страницу приложения (произвольную),
// которая будет переключаться на следующую страницу и обратно,
// используя динамическую загрузку.

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "Logic.js" as Logic

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Dynamic_Components")
    color: "light grey"

    property bool isInput: false

    Component.onCompleted: Logic.createSingInForm();


}
