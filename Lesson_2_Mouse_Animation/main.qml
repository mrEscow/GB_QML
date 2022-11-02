import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Mouse and Animation")

    Rectangle {
        width: 300
        height: width
        anchors.centerIn: parent
        color: "green"

        MouseArea {
            anchors.fill: parent

            onDoubleClicked: {
                parent.radius = parent.radius === 0 ? parent.height / 2 : 0;
            }

            onClicked: {
                parent.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            }

        }
    }
}
