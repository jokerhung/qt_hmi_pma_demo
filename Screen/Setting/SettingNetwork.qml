import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Util 1.0
import QtQuick.VirtualKeyboard 2.15
import "./"
import "../../Themes"
import "../../Component"

Item {
    id: root

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: parent.height
        width: parent.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: parent.height - inputPanel.height
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

    ColumnLayout{
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 40
        anchors.topMargin: 10
        spacing: 20

        Label {
            text: qsTr("Network")
            Layout.fillWidth: true
            font.pixelSize: 24
            font.bold: Font.Bold
            font.family: "Montserrat"
            verticalAlignment: Image.AlignVCenter
            Layout.alignment: Qt.AlignVCenter
            color: Theme.fontColor
        }

        RowLayout{
            Layout.fillWidth: true
            PrefsSettingsHeader{
                isBold: false
                fontColor: Theme.fontColor
                text: qsTr("Ip Address")
            }

            PrefsTextField{
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 10
                backwidth: 200
                placeTextColor: Theme.textFieldPlaceColor
                bgColor: Theme.textFieldColor
                fontName: FontStyle.getContentFont.name
                fontSize: Theme.t1
                readOnly: true
                text: Util.getIpAddress()
            }
        }

        RowLayout{
            Layout.fillWidth: true
            PrefsSettingsHeader{
                isBold: false
                fontColor: Theme.fontColor
                text: qsTr("Port")
            }

            PrefsTextField{
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 10
                backwidth: 200
                placeTextColor: Theme.textFieldPlaceColor
                bgColor: Theme.textFieldColor
                fontName: FontStyle.getContentFont.name
                fontSize: Theme.t1
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                text: staticSettings.valueString("networkPort", "8080")

                Keys.onReturnPressed: {
                    staticSettings.setValue("networkPort", text)
                    backend.updateSettings()
                }
            }
        }

        /*RowLayout{
            Layout.fillWidth: true
            PrefsSettingsHeader{
                isBold: false
                fontColor: Theme.fontColor
                text: qsTr("Timeout")
            }

            PrefsSpinBox {
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 10
                width: 200
                height: 50
                boxColor: Theme.spinBoxColor
                recColor: Theme.transparent
                fontColor: Theme.fontColor
                fontSize: Theme.t2
                value: staticSettings.valueString("networkTimeout", 3)
                minimumValue: 1
                maximumValue: 30
                onValueChanged:  {
                    staticSettings.setValue("networkTimeout", value)
                    backend.updateSettings()
                }
            }
        }*/
    }
}
