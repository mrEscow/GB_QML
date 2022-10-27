import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: labelRect
    height: defHeight
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
        margins: defMargin
    }
    radius: defRadius
    color: bubbleColor

    Label {
        anchors.fill: parent
        text: "Площадь треугольника, построенного на векторах"
        font.pixelSize: textPixels
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        font.bold: true
    }

}
