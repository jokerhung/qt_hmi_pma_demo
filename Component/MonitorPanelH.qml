import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property color bgPanelColor: "white" // "#363640"
    property color bgItemColor: "white" // "#363640"
    property color bgItemBlinkColor: "gray" // "#363640"
    property color borderColor: "#68acd9"
    property color textColorValue: "white"
    property color textColorCaption: "grey"
    property string panelIconTemp: "../assets/temperature.svg"
    property string panelIconCurrent: "../assets/current.svg"
    property string panelIconVolt: "../assets/voltage.svg"
    property string valueTemp: "59"
    property string unitTemp: "oC"
    property string valueCurrent: "5"
    property string unitCurrent: "A"
    property string valueVolt: "220"
    property string unitVolt: "V"
    property int panelWidth: 300
    property int panelHeight: 50

    width: panelWidth
    height: panelHeight

    Rectangle {
        id: rectangle
        color: bgPanelColor
        radius: 10
        anchors.fill: parent

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            //width: 100
            //height: 100
            spacing: 0

            MonitorItem {
                id: monitorTemp
                bgColor: bgItemColor
                blinkColor: bgItemBlinkColor
                icon: panelIconTemp
                iconSize: 20
                value: valueTemp
                valueSize: 20
                unit: unitTemp
                unitSize: 15
                panelWidth: 70
                panelHeight: 50
                textColor: textColorValue
                textColorUnit: textColorCaption
            }

            MonitorItem {
                id: monitorCurrent
                bgColor: bgItemColor
                blinkColor: bgItemBlinkColor
                icon: panelIconCurrent
                iconSize: 20
                value: valueCurrent
                valueSize: 20
                unit: unitCurrent
                unitSize: 15
                panelWidth: 70
                panelHeight: 50
                textColor: textColorValue
                textColorUnit: textColorCaption
            }

            MonitorItem {
                id: monitorVolt
                bgColor: bgItemColor
                blinkColor: bgItemBlinkColor
                icon: panelIconVolt
                iconSize: 20
                value: valueVolt
                valueSize: 20
                unit: unitVolt
                unitSize: 15
                panelWidth: 70
                panelHeight: 50
                textColor: textColorValue
                textColorUnit: textColorCaption
            }
        }
    }
}
