import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {
        id: textEditors
        spacing: 15
        x: 12
        y: 12
        width: parent.width - 26

        Label {
            color: "#565758"
            text: "Tap fields to enter text"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 22
        }

        TextField {
            width: parent.width
            placeholderText: "One line field"
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 50
        y: window.width
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
