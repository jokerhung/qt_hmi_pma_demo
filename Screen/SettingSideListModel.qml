import QtQuick 2.15
import QtQuick.Controls 2.5
//
// get All the unicode icon : https://emojiterra.com/satellite/
// https://iconduck.com/ --> duotone icons
// https://www.svgrepo.com/collection/iconsax-duotone-filled-icons/ --> best icons
//https://stackoverflow.com/questions/30266881/what-is-the-right-way-to-use-qquickimageprovider
ListModel {
    ListElement {
        iconName:"qrc:/assets/Settings/display.svg"
        iconColor:"transparent"
        name: qsTr("Display")
    }
    ListElement {
        iconName:"qrc:/assets/Settings/serialport-2.svg"
        iconColor:"transparent"
        name: qsTr("Serial Port")
    }
    ListElement {
        iconName:"qrc:/assets/Settings/monitor.svg"
        iconColor:"transparent"
        name: qsTr("Monitor")
    }
    ListElement {
        iconName:"qrc:/assets/Settings/network.svg"
        iconColor:"transparent"
        name: qsTr("Network")
    }
}
