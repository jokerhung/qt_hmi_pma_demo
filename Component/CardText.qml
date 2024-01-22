import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property color bgColor: "#363640"
    property color borderColor: "#68acd9"
    property color textColorValue: "white"
    property color textColorCaption: "grey"
    property color blinkColor: "cyan"
    property string caption: "Caption"
    property string value: "Value"
    property string unit: "Unit"
    property bool firstLauch: true

    Rectangle {
        id: recBg
        color: bgColor
        radius: 20
        border.color: borderColor
        anchors{
            left: parent.left
            leftMargin: -30
            top: parent.top
            topMargin: 0
            right: parent.right
            rightMargin: 0
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


        ColumnLayout {
            id: columnLayout
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 40

            Text {
                id: textCaption
                text: caption
                font.pixelSize: 20
                opacity: 0.8
                //verticalAlignment: Text.AlignVCenter
                font.styleName: "Bold"
                Layout.fillWidth: true
                Layout.preferredHeight: 20
                color: textColorCaption
                font.family: "Montserrat"
                font.bold: Font.Bold
                font.weight: Font.Bold
            }

            Text {
                id: textValue
                color: textColorValue
                text: value
                font.pixelSize: 80
                opacity: 0.8
                //horizontalAlignment: Text.AlignHCenter
                //verticalAlignment: Text.AlignVCenter
                font.styleName: "Bold"
                font.family: "Montserrat"
                font.bold: Font.Bold
                font.weight: Font.Bold

                onTextChanged: if(!firstLauch) animationId.restart(); else firstLauch = false;
            }

            Text {
                id: textUnit
                color: textColorCaption
                text: unit
                font.pixelSize: 40
                opacity: 0.8
                //horizontalAlignment: Text.AlignHCenter
                //verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                font.styleName: "grey"
                font.family: "Montserrat"
                font.bold: Font.Bold
                font.weight: Font.Bold
            }

        }
    }
}
