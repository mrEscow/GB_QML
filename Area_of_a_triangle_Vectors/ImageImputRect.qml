import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: imageImputRect

    height: defHeight * 2
    anchors {
        top: labelRect.bottom
        left: parent.left
        right: parent.right
        margins: defMargin
    }
    radius: defRadius
    color: bubbleColor
    z:5

    Image {
        id: image
        anchors.centerIn: parent
        source: "qrc:/images/triangle.png"
    }

    Rectangle {
        id: inputRectA
        anchors.right: image.left
        anchors.bottom: image.bottom
        anchors.bottomMargin: 4
        width: 60
        height: 30

        Row {
            anchors.fill: parent

            TextField  {
                id: ax
                width: 30
                height: 30
                text: "-2"

                validator: IntValidator {
                    bottom: -100
                    top: 10
                }

                Keys.onEnterPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
                Keys.onReturnPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
            }
            TextField  {
                id: ay
                width: 30
                height: 30
                text: "2"

                validator: IntValidator {
                    bottom:  -100
                    top: 10
                }

                Keys.onEnterPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
                Keys.onReturnPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
            }
        }
    }

    Rectangle {
        id: inputRectB
        anchors.right: image.right
        anchors.top: image.top
        anchors.rightMargin: 45
        width: 60
        height: 30

        Row {
            anchors.fill: parent

            TextField  {
                id: bx
                width: 30
                height: 30
                text: "4"

                validator: IntValidator {
                    bottom:  -100
                    top: 10
                }

                Keys.onEnterPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
                Keys.onReturnPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
            }
            TextField  {
                id: by
                width: 30
                height: 30
                text: "0"

                validator: IntValidator {
                    bottom:  -100
                    top: 10
                }

                Keys.onEnterPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
                Keys.onReturnPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
            }
        }
    }


    Rectangle {
        id: inputRectC
        anchors.left: image.right
        anchors.bottom: image.bottom
        anchors.bottomMargin: 35
        width: 60
        height: 30

        Row {
            anchors.fill: parent

            TextField  {
                id: cx
                width: 30
                height: 30
                text: "-2"

                validator: IntValidator {
                    bottom:  -100
                    top: 10
                }

                Keys.onEnterPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
                Keys.onReturnPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
            }
            TextField  {
                id: cy
                width: 30
                height: 30
                text: "0"

                validator: IntValidator {
                    bottom:  -100
                    top: 10
                }

                Keys.onEnterPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
                Keys.onReturnPressed: calculate(ax.text, ay.text, bx.text, by.text, cx.text, cy.text)
            }
        }
    }
}
