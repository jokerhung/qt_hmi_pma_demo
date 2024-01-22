import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property color bgColor: "#363640"
    property color borderColor: "#68acd9"
    property color textColorValue: "black"
    property color textColorCaption: "gray"
    property color blinkColor: "cyan"
    property string caption: "Caption"
    property string value: "Value"
    property string unit: "Unit"
    property string icon: "assets/fuel.svg"
    property bool firstLauch: true

    Rectangle {
        id: recBg
        color: bgColor
        radius: 20
        border.color: borderColor
        border.width: 1
        anchors{
            left: parent.left
            leftMargin: 0
            top: parent.top
            topMargin: 0
            right: parent.right
            rightMargin: -30
            bottom: parent.bottom
            bottomMargin: 0
        }

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
            anchors.leftMargin: 50

            spacing: 10

            Image {
                width: 50
                height: 50
                Layout.preferredWidth: 50
                Layout.preferredHeight: 50
                source: icon
                fillMode: Image.PreserveAspectFit
            }

            ColumnLayout{

                Row {
                    id: row
                    width: 200
                    height: 90

                    Label{
                        text: value
                        font.pixelSize: 30
                        font.family: "Montserrat"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: textColorValue

                        onTextChanged: if(!firstLauch) animationId.restart(); else firstLauch = false;
                    }

                    Label{
                        text: unit
                        font.pixelSize: 15
                        font.family: "Montserrat"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: textColorCaption
                    }
                }

                Label{
                    text: caption
                    font.pixelSize: 10
                    font.family: "Montserrat"
                    font.bold: Font.Normal
                    opacity: 0.8
                    color: textColorCaption
                }
            }
        }
    }
}
