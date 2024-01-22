import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    property int value: 50
    property int step: 1
    property int minimumValue: 0
    property int maximumValue: 100
    property string boxColor: "#313131"
    property string recColor: "transparent"
    property string fontColor: "#FFFFFF"
    property int fontSize: 14

    width: 100
    height: 55

    Rectangle {
        id: background
        color: recColor
        anchors.fill: parent
    }

    RowLayout {
        id: row
        spacing: 0
        width: parent.width
        height: parent.height

        PrefsButton{
            width: parent.height
            height: parent.height
            buttonText: "-"
            innerText.color: fontColor
            color: boxColor
            hoverColor: boxColor
            pressColor: boxColor
            borderColor: "grey"
            fontSize: 12
            borderWidth: 0.6
            borderRadius: 8
            onClicked: {
                if (value > minimumValue) {
                    value = value - step
                }
            }
        }

        Rectangle{
            width: parent.width - 2*parent.height
            height: parent.height
            radius: 12
            color: "transparent"
            Label {
                id: valueText
                text: value.toString()
                color: fontColor
                font.pixelSize: fontSize
                anchors.centerIn: parent
            }
        }

        PrefsButton{
            width: parent.height
            height: parent.height
            buttonText: "+";
            innerText.color: fontColor
            color: boxColor
            hoverColor: boxColor
            pressColor: boxColor
            borderColor: "grey"
            fontSize: 12
            borderWidth: 0.6
            borderRadius: 8
            onClicked: {
                if (value < maximumValue) {
                    value = value + step
                }
            }
        }
    }
}
