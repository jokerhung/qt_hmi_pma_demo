import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Util 1.0
import "./"
import "../../Themes"
import "../../Component"

Item {
    Component.onCompleted: {
        // get avaiable list
        serialPortNameModel.clear();

        var AvailablePorts = Util.getAvailableSerialPorts()
        for (var i = 0; i < AvailablePorts.length; i++)  {
            print("getAvailableSerialPorts: " + AvailablePorts[i]);
            serialPortNameModel.append({name: AvailablePorts[i]});
        }
    }

    ListModel{
        id:serialPortNameModel
        ListElement {
            name: "None"
        }
    }

    ListModel{
        id:serialBaudrateModel
        ListElement {
            name: "1200"
            value: 1200
        }
        ListElement {
            name: "2400"
            value: 2400
        }
        ListElement {
            name: "4800"
            value: 4800
        }
        ListElement {
            name: "9600"
            value: 9600
        }
        ListElement {
            name: "19200"
            value: 19200
        }
        ListElement {
            name: "38400"
            value: 38400
        }
        ListElement {
            name: "57600"
            value: 57600
        }
        ListElement {
            name: "115200"
            value: 115200
        }
    }

    ListModel{
        id:serialDataBitsModel
        ListElement {
            name: "5"
            value: 5
        }
        ListElement {
            name: "6"
            value: 6
        }
        ListElement {
            name: "7"
            value: 7
        }
        ListElement {
            name: "8"
            value: 8
        }
    }

    ListModel{
        id:serialParityModel
        ListElement {
            name: qsTr("No Parity")
            value: 0
        }
        ListElement {
            name: qsTr("Even Parity")
            value: 2
        }
        ListElement {
            name: qsTr("Odd Parity")
            value: 3
        }
        ListElement {
            name: qsTr("Space Parity")
            value: 4
        }
        ListElement {
            name: qsTr("Mark Parity")
            value: 5
        }
    }

    function findElementId(myModel, myValue) {
        for(var i = 0; i < myModel.count; i++) {
            var element = myModel.get(i);

            if(myValue === element.value) {
                return i;
            }
        }

        return -1;
    }

    function findElementIdByName(myModel, myValue) {
        for(var i = 0; i < myModel.count; i++) {
            var element = myModel.get(i);

            if(myValue === element.name) {
                return i;
            }
        }

        return -1;
    }

    ListModel{
        id:serialStopBitsModel
        ListElement {
            name: qsTr("One Stop")
            value: 1
        }
        ListElement {
            name: qsTr("One And Half Stop")
            value: 3
        }
        ListElement {
            name: qsTr("Two Stop")
            value: 2
        }
    }


    ColumnLayout{
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 40
        anchors.topMargin: 10
        spacing: 20

        Label {
            text: qsTr("Serial Port")
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
                text: qsTr("Name :")
            }

            PrefsComboBoxLabel{
                checkedColor: Theme.sideBarDarkColor
                bgItemSelectColor: Theme.comboSelectItemColor
                bgItemColor: Theme.transparent
                fontColor: Theme.fontColor
                bgColor: Theme.comboBgColor
                indicatorColor: Theme.comboIndicatorColor
                model: serialPortNameModel
                currentIndex: findElementIdByName(model, staticSettings.valueString("serialPort", "COM1"))
                onCurrentIndexChanged: {
                    staticSettings.setValue("serialPort", model.get(currentIndex).name)
                    backend.updateSettings()
                }
            }
        }

        RowLayout{
            Layout.fillWidth: true
            PrefsSettingsHeader{
                isBold: false
                fontColor: Theme.fontColor
                text: qsTr("BaudRate :")
            }

            PrefsComboBoxLabel{
                checkedColor: Theme.sideBarDarkColor
                bgItemSelectColor: Theme.comboSelectItemColor
                bgItemColor: Theme.transparent
                fontColor: Theme.fontColor
                bgColor: Theme.comboBgColor
                indicatorColor: Theme.comboIndicatorColor
                model: serialBaudrateModel
                currentIndex: findElementId(model, staticSettings.valueInt("serialBaudRate", 0))
                onCurrentIndexChanged: {
                    staticSettings.setValue("serialBaudRate", model.get(currentIndex).value)
                    backend.updateSettings()
                }
            }
        }

        RowLayout{
            Layout.fillWidth: true
            PrefsSettingsHeader{
                isBold: false
                fontColor: Theme.fontColor
                text: qsTr("DataBits :")
            }

            PrefsComboBoxLabel{
                checkedColor: Theme.sideBarDarkColor
                bgItemSelectColor: Theme.comboSelectItemColor
                bgItemColor: Theme.transparent
                fontColor: Theme.fontColor
                bgColor: Theme.comboBgColor
                indicatorColor: Theme.comboIndicatorColor
                model: serialDataBitsModel
                currentIndex: findElementId(model, staticSettings.valueInt("serialDatabits", 0))
                onCurrentIndexChanged: {
                    staticSettings.setValue("serialDatabits", model.get(currentIndex).value)
                    backend.updateSettings()
                }
            }
        }

        RowLayout{
            Layout.fillWidth: true
            PrefsSettingsHeader{
                isBold: false
                fontColor: Theme.fontColor
                text: qsTr("Parity :")
            }

            PrefsComboBoxLabel{
                checkedColor: Theme.sideBarDarkColor
                bgItemSelectColor: Theme.comboSelectItemColor
                bgItemColor: Theme.transparent
                fontColor: Theme.fontColor
                bgColor: Theme.comboBgColor
                indicatorColor: Theme.comboIndicatorColor
                model: serialParityModel
                currentIndex: findElementId(model, staticSettings.valueInt("serialParity", 0))
                onCurrentIndexChanged: {
                    staticSettings.setValue("serialParity", model.get(currentIndex).value)
                    backend.updateSettings()
                }
            }
        }

        RowLayout{
            Layout.fillWidth: true
            PrefsSettingsHeader{
                isBold: false
                fontColor: Theme.fontColor
                text: qsTr("StopBits :")
            }

            PrefsComboBoxLabel{
                checkedColor: Theme.sideBarDarkColor
                bgItemSelectColor: Theme.comboSelectItemColor
                bgItemColor: Theme.transparent
                fontColor: Theme.fontColor
                bgColor: Theme.comboBgColor
                indicatorColor: Theme.comboIndicatorColor
                model: serialStopBitsModel
                currentIndex: findElementId(model, staticSettings.valueInt("serialStopbits", 1))
                onCurrentIndexChanged: {
                    staticSettings.setValue("serialStopbits", model.get(currentIndex).value)
                    backend.updateSettings()
                }
            }
        }
    }
}
