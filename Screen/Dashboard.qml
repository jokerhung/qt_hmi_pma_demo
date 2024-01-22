import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Component"
import "../Themes"
import "../Model"

Item {
    readonly property string name: "Dashboard"
    readonly property double margin: 10
    readonly property color cardColor: Theme.cardColor
    readonly property color cardBorderColor: Theme.cardBorderColor
    property int powerValue : Model.totalPower
    property int inputValue : Model.inputPower
    property double vswrValue : Model.vswr
    property int tempValue : Model.temperature
    property double currentValue : Model.current
    property int voltValue : Model.voltage
    property int fanValue : Model.fanSpeed

    RowLayout {
        id: layoutMain
        anchors.fill: parent
        spacing: margin * 2

        Rectangle {
            id: recLeft
            color: "#00363640"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 100
            radius: 20

            ColumnLayout {
                id: layoutLeft
                anchors.fill: parent
                spacing: margin * 2

                CardText {
                    id: cardInput
                    bgColor: cardColor
                    borderColor: cardColor
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    textColorCaption: Theme.textColorCaption
                    textColorValue: Theme.textColorValue
                    blinkColor: Theme.cardBlinkColor
                    caption: qsTr("Input Power")
                    value: inputValue
                    unit: "W"
                }

                CardText {
                    id: cardVSWR
                    bgColor: cardColor
                    borderColor: cardColor
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    textColorCaption: Theme.textColorCaption
                    textColorValue: Theme.textColorValue
                    blinkColor: Theme.cardBlinkColor
                    caption: qsTr("VSWR")
                    value: vswrValue
                    unit: ""
                }
            }
        }

        Rectangle {
            id: recCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 200
            color: cardColor
            radius: 20
            border.color: cardBorderColor
            border.width: 1

            Gauge {
                id: totalPower
                anchors.fill: parent
                anchors.margins: 20
                bgColor: Theme.gaugeBgColor
                speedColor: Theme.gaugeBgColor
                textColor: Theme.textColorValue
                valueColorSmall: Theme.gaugeValueColorSmall
                valueColorLarge: Theme.gaugeValueColorLarge

                property bool accelerating
                value: powerValue
                maximumValue: 280

                //anchors.top: parent.top
                //anchors.topMargin:Math.floor(parent.height * 0.25)
                anchors.horizontalCenter: parent.horizontalCenter

                Component.onCompleted: forceActiveFocus()

                Behavior on value { NumberAnimation { duration: 1000 }}
            }
        }

        Rectangle {
            id: recRight
            color: "#00363640"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: 100
            radius: 20

            ColumnLayout {
                id: layoutRight
                anchors.fill: parent
                spacing: margin * 2

                CardIcon {
                    id: cardTemp
                    bgColor: cardColor
                    borderColor: cardColor
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    caption: qsTr("Tempeture")
                    value: tempValue
                    unit: "0C"
                    icon: Theme.isDarkMode ? "../assets/temperature-2.svg" : "../assets/temperature-light-2.svg"
                    textColorValue: Theme.textColorValue
                    textColorCaption: Theme.textColorCaption
                    blinkColor: Theme.cardBlinkColor
                }

                CardIcon {
                    id: cardCurrent
                    bgColor: cardColor
                    borderColor: cardColor
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    caption: qsTr("Current")
                    value: currentValue
                    unit: "A"
                    icon: Theme.isDarkMode ? "../assets/current.svg" : "../assets/current-light-2.svg"
                    textColorValue: Theme.textColorValue
                    textColorCaption: Theme.textColorCaption
                    blinkColor: Theme.cardBlinkColor
                }

                CardIcon {
                    id: cardVolt
                    bgColor: cardColor
                    borderColor: cardColor
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    caption: qsTr("Voltage")
                    value: voltValue
                    unit: "V"
                    icon: Theme.isDarkMode ? "../assets/voltage2.svg" : "../assets/voltage2-light-2.svg"
                    textColorValue: Theme.textColorValue
                    textColorCaption: Theme.textColorCaption
                    blinkColor: Theme.cardBlinkColor
                }

                CardIcon {
                    id: cardFan
                    bgColor: cardColor
                    borderColor: cardColor
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    caption: qsTr("Fan")
                    value: fanValue
                    unit: qsTr("Level")
                    icon: Theme.isDarkMode ? "../assets/fan.svg" : "../assets/fan-light-2.svg"
                    textColorValue: Theme.textColorValue
                    textColorCaption: Theme.textColorCaption
                    blinkColor: Theme.cardBlinkColor
                }

            }
        }
    }
}
