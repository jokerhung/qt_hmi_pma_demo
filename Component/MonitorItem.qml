import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property color bgColor: "#363640"
    property color blinkColor: "gray"
    property color borderColor: "#68acd9"
    property color textColor: "white"
    property color textColorUnit: "grey"
    property string caption: "Tempature"
    property string value: "59"
    property string unit: "oC"
    property string icon: "../assets/temperature.svg"
    property int iconSize: 20
    property int valueSize: 20
    property int  unitSize: 15
    property int  panelWidth: 100
    property int  panelHeight: 50
    property bool firstLauch: true

    width: panelWidth
    height: panelHeight

    Rectangle {
        id: recBg
        color: bgColor
        radius: 10
        border.color: bgColor
        border.width: 1
        anchors.fill: parent

        SequentialAnimation {
            id: animationId
            loops: 2
            PropertyAnimation {
                target: recBg
                property: "color"
                to: blinkColor
                duration: 500
            }
            PropertyAnimation {
                target: recBg
                property: "color"
                to: bgColor
                duration: 500
            }
        }

        RowLayout{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10

            spacing: 5

            Image {
                //width: 30
                //height: 30
                Layout.preferredWidth: iconSize
                Layout.preferredHeight: iconSize
                source: icon
                fillMode: Image.PreserveAspectFit
            }

            ColumnLayout{

                Row {
                    id: row
                    //width: 200
                    //height: 90

                    Label{
                        text: value
                        font.pixelSize: valueSize
                        font.family: "Montserrat"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: textColor

                        onTextChanged: if(!firstLauch) animationId.restart(); else firstLauch = false;
                    }

                    Label{
                        text: unit
                        font.pixelSize: unitSize
                        font.family: "Montserrat"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: textColorUnit
                    }
                }
            }
        }
    }
}
