import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property string itemValue: "50"
    property string itemUnit: " W"
    property int itemWidth: 79
    property int itemHeight: 40
    property int itemFontSize: 25
    property color itemFontColor: "white"
    property color itemBgColor: "#489eeb"
    property color itemBlinkColor: "#8cc3f2"
    property double posX: 100
    property double posY: 100
    property bool firstLauch: true

    Label {
        id: labelInputPower
        text: itemValue + itemUnit
        x: posX
        y: posY
        width: itemWidth
        height: itemHeight
        font.bold: true
        font.pixelSize: itemFontSize
        color: itemFontColor

        onTextChanged: if(!firstLauch) labelInputPowerAnimation.restart(); else firstLauch = false;

        background: Rectangle {
            id: labelInputPowerRec
            color: itemBgColor
            radius: 7

            SequentialAnimation {
                id: labelInputPowerAnimation
                loops: 2
                PropertyAnimation {
                    target: labelInputPowerRec
                    property: "color"
                    to: itemBlinkColor
                    duration: 500
                }
                PropertyAnimation {
                    target: labelInputPowerRec
                    property: "color"
                    to: itemBgColor
                    duration: 500
                }
            }
        }
    }
}
