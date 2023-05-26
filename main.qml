import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Touchscreen test")
    visibility: Window.FullScreen

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressed: (mouse) => {
            target.x = mouse.x
            target.y = mouse.y
            console.log("Released at ", mouse.x, ";", mouse.y)
        }

        onReleased: (mouse) => {
            target.x = mouse.x
            target.y = mouse.y
            console.log("Pressed at  ", mouse.x, ";", mouse.y)
        }

        onClicked: (mouse) => {
            console.log("Clicked at  ", mouse.x, ";", mouse.y)
        }
    }
    Item {
        id: target

        property color color: mouseArea.pressed ? "red" : "blue"

        Rectangle {
            color: "white"
            border.width: 2
            border.color: parent.color
            opacity: 0.3
            anchors.centerIn: parent
            width: 400
            height: 400
            radius: width/2
        }
        Rectangle {
            color: "white"
            border.width: 2
            border.color: parent.color
            opacity: 0.6
            anchors.centerIn: parent
            width: 200
            height: 200
            radius: width/2
        }
        Rectangle {
            border.color: parent.color
            anchors.centerIn: parent
            width: 40
            height: 40
            radius: width/2
            Rectangle {
                color: target.color
                height: parent.height
                width: 1
                anchors.centerIn: parent
            }
            Rectangle {
                color: target.color
                height: 1
                width: parent.width
                anchors.centerIn: parent
            }
        }
    }

    Text {
        anchors.centerIn: parent
        font.pixelSize: 20
        text: (mouseArea.pressed ? "pressed" : "not pressed") + "\n" +
              target.x + " ; " + target.y
    }
}
