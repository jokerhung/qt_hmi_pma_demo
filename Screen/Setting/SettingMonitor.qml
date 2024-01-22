import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import "./"
import "../../Themes"
import "../../Component"

Item {
    ColumnLayout{
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 40
        anchors.topMargin: 40
        spacing: 30

        Label {
            text: qsTr("Monitor")
            Layout.fillWidth: true
            font.pixelSize: 24
            font.bold: Font.Bold
            font.family: "Montserrat"
            verticalAlignment: Image.AlignVCenter
            Layout.alignment: Qt.AlignVCenter
            color: Theme.fontColor
        }

        ColumnLayout{
            spacing: 10
            Label {
                text: qsTr("Interval (seconds)")
                Layout.fillWidth: true
                font.pixelSize: 20
                font.family: "Montserrat"
                verticalAlignment: Image.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
                color: Theme.fontColor
            }

            TSlider{
                width: 480
                height: 60
                checkedColor: Theme.sliderCheckedColor
                bgColor: Theme.sliderBgColor
                fontColor: Theme.fontColor
                from:1
                to:30
                stepSize: 1
                value: staticSettings.valueInt("MonitorInterval",3)
                onValueChanged: staticSettings.setValue("MonitorInterval", value)
            }
        }

        ColumnLayout{
            spacing: 10
            Label {
                text: qsTr("Timeout (seconds)")
                Layout.fillWidth: true
                font.pixelSize: 20
                font.family: "Montserrat"
                verticalAlignment: Image.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
                color: Theme.fontColor
            }

            TSlider{
                width: 480
                height: 60
                checkedColor: Theme.sliderCheckedColor
                bgColor: Theme.sliderBgColor
                fontColor: Theme.fontColor
                from:3
                to:30
                stepSize: 1
                value: staticSettings.valueInt("serialWaitTimeout",10)
                onValueChanged: staticSettings.setValue("serialWaitTimeout", value)
            }
        }
    }
}
