import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Util 1.0
import './Component'
import './Screen'
import "Themes"
import "Model"

Window {
    id: window

    // property
    readonly property double zoom: 1
    readonly property double margin: 10
    readonly property color backgroundColor:"#0E0E0E"
    readonly property color footerBackground:"#17161c"
    readonly property color cardColor: "#363640"
    readonly property color cardBorderColor: "#68acd9"
    readonly property color checkedIconColor:"#80489eeb"
    readonly property color unCheckedIconColor :"#50777781"
    property string connection: "Disconnect"

    // variable
    property string currentPage : "Dashboard"

    width: 800
    height: 480
    visible: true
    color: Theme.backgroundColor
    title: qsTr("VNES")

    Component.onCompleted: {
        Theme.isDarkMode = staticSettings.valueInt("themeSelect",0) === 0 ? true : false
    }

    Rectangle {
        id: recFooter
        height: 50
        color: Theme.footerBackground
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        RowLayout {
            id: layoutFooter
            spacing: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            Rectangle {
                id: recFooterLeft
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 200
                color: "#00ffffff"

                RowLayout {
                    id: layoutFooterLeft
                    spacing: 80
                    anchors.leftMargin: 30
                    anchors.rightMargin: 30
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter

                    IconButton{
                        id: iconDashboard
                        setIcon: "../assets/dashboard.svg"
                        setIconSize: 10
                        isGlow: true
                        roundIcon: true
                        iconWidth: 30
                        iconHeight: 30
                        circleWidth: 40
                        circleHeight: 40
                        iconBackground: currentPage == "Dashboard" ? checkedIconColor : unCheckedIconColor
                        onClicked: {
                            stackViewMain.replace("Screen/Dashboard.qml")
                            currentPage = "Dashboard"
                        }
                    }

                    IconButton{
                        id: iconMonitor
                        setIcon: "../assets/monitor.svg"
                        setIconSize: 10
                        isGlow: true
                        roundIcon: true
                        iconWidth: 30
                        iconHeight: 30
                        circleWidth: 40
                        circleHeight: 40
                        iconBackground: currentPage == "Monitor" ? checkedIconColor : unCheckedIconColor
                        onClicked: {
                            stackViewMain.replace("Screen/Monitor.qml")
                            currentPage = "Monitor"
                        }
                    }

                    IconButton{
                        id: iconSetting
                        setIcon: "../assets/setting-2.svg"
                        setIconSize: 10
                        isGlow: true
                        roundIcon: true
                        iconWidth: 30
                        iconHeight: 30
                        circleWidth: 40
                        circleHeight: 40
                        iconBackground: currentPage == "Setting" ? checkedIconColor : unCheckedIconColor
                        onClicked: {
                            stackViewMain.replace("Screen/Setting.qml")
                            currentPage = "Setting"
                        }
                    }
                }
            }

            IconButton{
                id: iconPowerOnOff
                setIcon: Model.power_state == 1 ? "../assets/power-on-2.svg" : "../assets/power-off-2.svg"
                setIconSize: 10
                isGlow: false
                roundIcon: true
                iconWidth: 50
                iconHeight: 50
                circleWidth: 80
                circleHeight: 80
                iconBackground: "#ff777781"
                onClicked: {
                    if(Model.power_state == 1) {
                        backend.power(0)
                    } else {
                        backend.power(1)
                    }
                }
            }

            Rectangle {
                id: recFooterRight
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 200
                color: "#00ffffff"

                RowLayout {
                    id: layoutFooterRight
                    spacing: 30
                    anchors.leftMargin: 40
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter

                    /*IconButton{
                        id: iconFan
                        setIcon: "../assets/fan-auto.svg"
                        setIconSize: 10
                        isGlow: true
                        roundIcon: true
                        iconWidth: 30
                        iconHeight: 30
                        circleWidth: 40
                        circleHeight: 40
                        iconBackground: unCheckedIconColor

                        onClicked: {
                            backend.test("test string")
                        }
                    }*/

                    IconButton{
                        id: iconFanMode
                        //setIcon: Model.fan_mode == 1 ? "../assets/fan-auto.svg" : "../assets/fan-manual.svg"
                        setIconText: Model.fan_mode == 1 ? "A" : "M"
                        setIconSize: 20
                        roundIcon: true
                        iconWidth: 30
                        iconHeight: 30
                        circleWidth: 40
                        circleHeight: 40
                        setIconColor: "white"
                        iconBackground: unCheckedIconColor
                        onClicked: {
                            Model.fan_mode = Model.fan_mode == 1 ? 0 : 1
                        }
                    }

                    Slider {
                        id: slideFanSpeed
                        from: 1
                        to: 3
                        value: Model.fanSpeed
                        stepSize : 1
                        snapMode: "SnapAlways"
                        width: 50
                        enabled: Model.fan_mode == 1 ? false : true
                        onValueChanged: {
                            if(Model.fan_mode == 0)
                                backend.setFan(slideFanSpeed.value)
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: recMain
        color: "#00ffffff"
        anchors.top: recHeader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: recFooter.top
        anchors.topMargin: margin
        anchors.rightMargin: margin
        anchors.leftMargin: margin
        anchors.bottomMargin: 2*margin

        StackView {
            id: stackViewMain
            anchors.fill: parent
            initialItem: "Screen/Dashboard.qml"
        }
    }

    Rectangle {
        id: recHeader
        height: 40
        color: Theme.headerBackground
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        opacity: 0.8

        RowLayout {
            id: layoutHeader
            spacing: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            Rectangle {
                id: recHeaderLeft
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 200
                color: "#00ff0000"

                Label {
                    id: labelProduct
                    color: Theme.textColorValue
                    text: qsTr("High PA System")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.family: "Montserrat"
                    font.bold: Font.Bold
                    font.weight: Font.Bold
                    font.pixelSize: 20
                    anchors.leftMargin: 10
                    opacity: 0.8
                }
            }

            Rectangle {
                id: recHeaderCenter
                width: 100
                height: 40
                color: "#0000ff00"

                Label {
                    id: labelDemo
                    color: Theme.textColorValue
                    text: qsTr("High PA System")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.family: "Montserrat"
                    font.bold: Font.Bold
                    font.weight: Font.Bold
                    font.pixelSize: 20
                    anchors.leftMargin: 10
                    opacity: 0.8
                }
            }

            Rectangle {
                id: recHeaderRight
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 200
                color: "#000000ff"

                Flow {
                    id: flowHeaderRight
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.fill: parent
                    spacing: 10
                    layoutDirection: Qt.RightToLeft


                    /*IconButton{
                        id: iconDarkMode
                        setIcon: Theme.isDarkMode ? "../assets/dark-mode.svg" : "../assets/light-mode-2.svg"
                        setIconSize: 20
                        roundIcon: true
                        iconWidth: Theme.isDarkMode ? 20 : 30
                        iconHeight: Theme.isDarkMode ? 20 : 30
                        circleWidth: 35
                        circleHeight: 35
                        setIconColor: "white"
                        iconBackground: "transparent"

                        onPressed: {
                            Theme.isDarkMode = Theme.isDarkMode == true ? false : true
                        }
                    }*/

                    IconButton{
                        id: iconConnect
                        setIcon: connection == "Disconnect" ? "../assets/disconnect-5.svg" : Theme.isDarkMode ? "../assets/connected-5-cyan.svg" : "../assets/connected-5-blue.svg"
                        setIconSize: 20
                        roundIcon: true
                        iconWidth: 25
                        iconHeight: 25
                        circleWidth: 30
                        circleHeight: 30
                        setIconColor: "white"
                        iconBackground: "transparent"

                        onPressed: {
                            backend.connectServer()
                        }
                    }
                }
            }
        }
    }

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: {
            labelProduct.text = Qt.formatTime(new Date(),"hh:mm:ss")
            if(Util.getIpAddress() !== "") {
                connection = "Connect"
            } else {
                connection = "Disconnect"
            }
        }
    }

    Connections {
        target: backend

        function onDataChanged(){
            console.log(backend.data)
            let obj = JSON.parse(backend.data);
            if(obj.totalPower !== undefined) Model.totalPower = obj.totalPower
            if(obj.inputPower !== undefined) Model.inputPower = obj.inputPower
            if(obj.vswr !== undefined) Model.vswr = obj.vswr
            if(obj.temperature !== undefined) Model.temperature = obj.temperature
            if(obj.current !== undefined) Model.current = obj.current
            if(obj.voltage !== undefined) Model.voltage = obj.voltage
            if(obj.fanSpeed !== undefined && Model.fan_mode == 1) Model.fanSpeed = obj.fanSpeed
            if(obj.P1_temp !== undefined) Model.p1_temperature = obj.P1_temp
            if(obj.P1_current !== undefined) Model.p1_current = obj.P1_current
            if(obj.P1_voltage !== undefined) Model.p1_voltage = obj.P1_voltage
            if(obj.P2_temp !== undefined) Model.p2_temperature = obj.P2_temp
            if(obj.P2_current !== undefined) Model.p2_current = obj.P2_current
            if(obj.P2_voltage !== undefined) Model.p2_voltage = obj.P2_voltage
            if(obj.P3_temp !== undefined) Model.p3_temperature = obj.P3_temp
            if(obj.P3_current !== undefined) Model.p3_current = obj.P3_current
            if(obj.P3_voltage !== undefined) Model.p3_voltage = obj.P3_voltage
            if(obj.P4_temp !== undefined) Model.p4_temperature = obj.P4_temp
            if(obj.P4_current !== undefined) Model.p4_current = obj.P4_current
            if(obj.P4_voltage !== undefined) Model.p4_voltage = obj.P4_voltage
            if(obj.power_state !== undefined) Model.power_state = obj.power_state
        }

        function onFanChanged(){
            console.log(backend.fan)
            let obj = JSON.parse(backend.fan);
            if(obj.fanSpeed !== undefined && Model.fan_mode == 0) Model.fanSpeed = obj.fanSpeed
        }
    }
}
