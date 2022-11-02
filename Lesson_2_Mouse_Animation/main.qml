import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Mouse and Animation")

    Rectangle {
        id: rectangle
        width: 300
        height: width
        anchors.centerIn: parent
        color: "green"

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onDoubleClicked: {
                if (mouse.button === Qt.LeftButton)
                    parent.radius = parent.radius === 0 ? parent.height / 2 : 0;
            }

            onClicked: {
                if (mouse.button === Qt.RightButton)
                    rotationAnimation.start();
                else if (mouse.button === Qt.LeftButton)
                    parent.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            }
        }

        RotationAnimation on rotation{
            id: rotationAnimation
            from:0
            to: 360
            duration: 1000;
            running: false
        }
    }
}
