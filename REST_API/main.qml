import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Logic.js" as Logic

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("REST API")

    property string url: "http://127.0.0.1:5000/staff"

    TextField {
        id: urlPath
        width: 2/3 * parent.width
        height: 50
        text: url
    }

    Button {
        width: 1/3 * parent.width
        height: 50
        anchors.left: urlPath.right
        text: "GO"

        onClicked: {
            url = urlPath.text
            Logic.getData(url)
        }
    }

}
