import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: outputRect
    height: defHeight
    anchors {
        top: imageImputRect.bottom
        left: parent.left
        right: parent.right
        margins: defMargin
    }
    radius: defRadius
    color: bubbleColor

    Label {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.right: parent.horizontalCenter
        text: "Ответ:   S="
        font.pixelSize: textPixels
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

    Label {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.horizontalCenter
        text: result
        font.pixelSize: textPixels
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.bold: true
    }

}
