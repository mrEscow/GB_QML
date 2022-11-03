import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 400
    height: 500
    visible: true
    title: qsTr("Models and Views")
    color: "darkgrey"

    ListModel{
        id:books
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/book/764/orig/i764563.jpg?cu=20221031133501"
            name: "Джек Ричер: Лучше быть мертвым"
            autor: "Чайлд Л."
            genre: "Детектив"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/book/763/orig/i763468.jpg?cu=20221018151501"
            name: "В доме лжи"
            autor: "Рэнкин Й."
            genre: "Детектив"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/book/764/orig/i764752.jpg?cu=20221102140503"
            name: "Квартира в Париже"
            autor: "Фоли Л."
            genre: "Детектив"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/book/756/orig/i756565.jpg?cu=20220721123500"
            name: "\"ГESS\" Тайный план Черчилля"
            autor: "Сосновский А."
            genre: "Детектив"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/ap/t1/258/258559/258559.jpg"
            name: "Гарри Поттер и Принц-полукровка"
            autor: "Ролинг Дж. К. - 2005"
            genre: "Детская литература"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/ap/t1/375/375380/375380.JPG"
            name: "Памятник Чижу"
            autor: "Мельников И. В. - 1988"
            genre: "Детская литература"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/ap/t1/375/375296/375296.jpg"
            name: "Приключения Чиполлино"
            autor: "Родари Д. - 1996"
            genre: "Детская литература"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/book/525/w259/i525835.jpg?cu=20180101000000"
            name: "Константин Победоносцев. Интеллектуал во власти"
            autor: "Фирсов С. Л."
            genre: "Русская проза и поэзия"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/book/316/w259/i316729.jpg?cu=20180101000000"
            name: "Иосиф Бродский. Опыт литературной биографии"
            autor: "Лосев Л. В."
            genre: "Русская проза и поэзия"
        }
        ListElement{
            iconPath: "https://www.moscowbooks.ru/image/book/241/w259/i241847.jpg?cu=20180101000000"
            name: "Мертвые души"
            autor: "Гоголь Н. В."
            genre: "Русская проза и поэзия"
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: books
        spacing: 5


        // Хэдер
        header: Rectangle {
            width: parent.width
            height: 40
            color: "darkblue"
            Text {
                anchors.centerIn: parent
                text: "www.moscowbooks.ru"
                color: "white"
                font.bold: true
                font.pixelSize: 24
            }

        }

        // Футер
        footer: Rectangle {
            width: parent.width
            height: 40
            color: "darkgreen"
            Text {
                anchors.centerIn: parent
                text: "Лучезарный пирожок"
                color: "white"
                font.bold: true
                font.pixelSize: 24
            }
        }

        // Секции по группам пользователей
        section.delegate: Rectangle {
            width: parent.width
            height: 20
            color: "lightblue"
            Text {
                anchors.centerIn: parent
                text: section
                color: "darkblue"
                font.weight: Font.Bold
            }
        }
        section.property: "genre"


        // Сами элементы
        delegate: Rectangle {
            id: delegat
            width: parent.width
            height: 100
            color: "grey"
            Row {
                Image {
                    width: delegat.height * 2/3
                    height: delegat.height
                    source: iconPath
                }
                Column {
                    Text{
                        width: 300
                        height: delegat.height / 2
                        text: name
                        font.bold: true
                        font.pixelSize: 18
                    }
                    Text{
                        width: 300
                        height: delegat.height / 2
                        text: "Автор: " + autor
                        font.bold: true
                        font.pixelSize: 18
                    }
                }
            }
        }
    }
}
