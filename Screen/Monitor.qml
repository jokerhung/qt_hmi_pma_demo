import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Component"
import "../Themes"
import "../Model"

Item {
    readonly property string name: "Monitor"
    property color cardColor: "#363640"
    property int designWidth: 1024
    property int designHeight: 500
    property bool firstLauch: true

    anchors.fill: parent
    width: 1024
    height: 500

    Image {
        id: image1
        anchors.fill: parent
        source: Theme.isDarkMode ? "../assets/circuit-dark.svg" : "../assets/circuit-light.svg"
        fillMode: Image.PreserveAspectFit

        MonitorLabel {
            id: labelInputPower
            itemValue: Model.inputPower
            itemUnit: " W"
            posX: 33*(parent.paintedWidth / designWidth) + (parent.width - parent.paintedWidth) / 2
            posY: 212*(parent.paintedHeight / designHeight) + (parent.height - parent.paintedHeight) / 2
            itemWidth: 79
            itemHeight: 40
            itemFontSize: 25
            itemFontColor: "white"
            itemBgColor: Theme.monitorCardBgColor
            itemBlinkColor: Theme.monitorCardBlinkColor
        }

        MonitorLabel {
            id: labelVSWRPower
            itemValue: Model.vswr
            itemUnit: ""
            posX: 770*(parent.paintedWidth / designWidth) + (parent.width - parent.paintedWidth) / 2
            posY: 212*(parent.paintedHeight / designHeight) + (parent.height - parent.paintedHeight) / 2
            itemWidth: 79
            itemHeight: 40
            itemFontSize: 25
            itemFontColor: "white"
            itemBgColor: Theme.monitorCardBgColor
            itemBlinkColor: Theme.monitorCardBlinkColor
        }

        MonitorLabel {
            id: labelOutputPower
            itemValue: Model.totalPower
            itemUnit: " W"
            posX: 900*(parent.paintedWidth / designWidth) + (parent.width - parent.paintedWidth) / 2
            posY: 212*(parent.paintedHeight / designHeight) + (parent.height - parent.paintedHeight) / 2
            itemWidth: 79
            itemHeight: 40
            itemFontSize: 25
            itemFontColor: "white"
            itemBgColor: Theme.monitorCardBgColor
            itemBlinkColor: Theme.monitorCardBlinkColor
        }

        MonitorPanelV {
            id: monitorInput
            panelWidth: 100
            panelHeight: 150
            x: 180*(parent.paintedWidth / designWidth) + (parent.width - parent.paintedWidth) / 2
            y: 280*(parent.paintedHeight / designHeight) + (parent.height - parent.paintedHeight) / 2
            bgPanelColor: Theme.cardColor
            bgItemColor: Theme.cardColor
            textColorValue: Theme.textColorValue
            textColorCaption: Theme.textColorCaption
            panelIconTemp: Theme.isDarkMode ? "../assets/temperature-2.svg" : "../assets/temperature-light-2.svg"
            panelIconCurrent: Theme.isDarkMode ? "../assets/current.svg" : "../assets/current-light-2.svg"
            panelIconVolt: Theme.isDarkMode ? "../assets/voltage2.svg" : "../assets/voltage2-light-2.svg"
            valueTemp: Model.temperature
            valueCurrent: Model.current
            valueVolt: Model.voltage
        }

        MonitorPanelH {
            id: monitorP1
            panelWidth: 270
            panelHeight: 50
            x: 400*(parent.paintedWidth / designWidth) + (parent.width - parent.paintedWidth) / 2
            y: 100*(parent.paintedHeight / designHeight) + (parent.height - parent.paintedHeight) / 2
            bgPanelColor: Theme.cardColor
            bgItemColor: Theme.cardColor
            textColorValue: Theme.textColorValue
            textColorCaption: Theme.textColorCaption
            panelIconTemp: Theme.isDarkMode ? "../assets/temperature-2.svg" : "../assets/temperature-light-2.svg"
            panelIconCurrent: Theme.isDarkMode ? "../assets/current.svg" : "../assets/current-light-2.svg"
            panelIconVolt: Theme.isDarkMode ? "../assets/voltage2.svg" : "../assets/voltage2-light-2.svg"
            valueTemp: Model.p1_temperature
            valueCurrent: Model.p1_current
            valueVolt: Model.p1_voltage
        }

        MonitorPanelH {
            id: monitorP2
            panelWidth: 270
            panelHeight: 50
            x: 400*(parent.paintedWidth / designWidth) + (parent.width - parent.paintedWidth) / 2
            y: 200*(parent.paintedHeight / designHeight) + (parent.height - parent.paintedHeight) / 2
            bgPanelColor: Theme.cardColor
            bgItemColor: Theme.cardColor
            textColorValue: Theme.textColorValue
            textColorCaption: Theme.textColorCaption
            panelIconTemp: Theme.isDarkMode ? "../assets/temperature-2.svg" : "../assets/temperature-light-2.svg"
            panelIconCurrent: Theme.isDarkMode ? "../assets/current.svg" : "../assets/current-light-2.svg"
            panelIconVolt: Theme.isDarkMode ? "../assets/voltage2.svg" : "../assets/voltage2-light-2.svg"
            valueTemp: Model.p2_temperature
            valueCurrent: Model.p2_current
            valueVolt: Model.p2_voltage
        }

        MonitorPanelH {
            id: monitorP3
            panelWidth: 270
            panelHeight: 50
            x: 400*(parent.paintedWidth / designWidth) + (parent.width - parent.paintedWidth) / 2
            y: 300*(parent.paintedHeight / designHeight) + (parent.height - parent.paintedHeight) / 2
            bgPanelColor: Theme.cardColor
            bgItemColor: Theme.cardColor
            textColorValue: Theme.textColorValue
            textColorCaption: Theme.textColorCaption
            panelIconTemp: Theme.isDarkMode ? "../assets/temperature-2.svg" : "../assets/temperature-light-2.svg"
            panelIconCurrent: Theme.isDarkMode ? "../assets/current.svg" : "../assets/current-light-2.svg"
            panelIconVolt: Theme.isDarkMode ? "../assets/voltage2.svg" : "../assets/voltage2-light-2.svg"
            valueTemp: Model.p3_temperature
            valueCurrent: Model.p3_current
            valueVolt: Model.p3_voltage
        }

        MonitorPanelH {
            id: monitorP4
            panelWidth: 270
            panelHeight: 50
            x: 400*(parent.paintedWidth / designWidth) + (parent.width - parent.paintedWidth) / 2
            y: 400*(parent.paintedHeight / designHeight) + (parent.height - parent.paintedHeight) / 2
            bgPanelColor: Theme.cardColor
            bgItemColor: Theme.cardColor
            textColorValue: Theme.textColorValue
            textColorCaption: Theme.textColorCaption
            panelIconTemp: Theme.isDarkMode ? "../assets/temperature-2.svg" : "../assets/temperature-light-2.svg"
            panelIconCurrent: Theme.isDarkMode ? "../assets/current.svg" : "../assets/current-light-2.svg"
            panelIconVolt: Theme.isDarkMode ? "../assets/voltage2.svg" : "../assets/voltage2-light-2.svg"
            valueTemp: Model.p4_temperature
            valueCurrent: Model.p4_current
            valueVolt: Model.p4_voltage
        }
    }
}
