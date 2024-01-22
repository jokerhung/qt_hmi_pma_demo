import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ComboBox {
    id: root
    property color checkedColor: "#313131"
    property bool isBold: false
    property string fontName: "Montserrat"
    property color bgItemSelectColor: Material.accent
    property color bgItemColor: "transparent"
    property color fontColor: "#FFFFFF"
    property int fontSize: 14
    property color bgColor: "grey"
    property color indicatorColor: "white"


    delegate:ItemDelegate {
        id:itemDelegate
        width: root.width * 1.4
        height: 40
        hoverEnabled: true
        focus: true

        background: Rectangle{
            color: itemDelegate.hovered ? bgItemSelectColor : bgItemColor
            anchors.fill: parent
            radius: 8
        }

        RowLayout {
            Layout.alignment: Qt.AlignVCenter
            width: parent.width
            height: parent.height
            anchors.fill: parent
            spacing: 10
            Layout.leftMargin: 10
            Layout.rightMargin: 10

            Label {
                opacity: 0.87
                text: name
                color: fontColor
                Layout.fillWidth: true
                font.family: fontName
                font.pixelSize: isBold ? fontSize : fontSize
                font.bold: isBold ? Font.Bold : Font.Normal
                font.weight: isBold ? Font.Bold : Font.Normal
                verticalAlignment: Image.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 10
            }

            Label {
                opacity: 0.87
                text: "✅"
                visible: root.currentIndex == index
                Layout.fillWidth: true
                font.family: fontName
                font.pixelSize: isBold ? fontSize : fontSize
                font.bold: isBold ? Font.Bold : Font.Normal
                font.weight: isBold ? Font.Bold : Font.Normal
                verticalAlignment: Image.AlignVCenter
                horizontalAlignment: Image.AlignRight
                Layout.alignment: Qt.AlignVCenter
                Layout.rightMargin: 10
            }
        }

    }

    indicator: Canvas {
        id: canvas
        x: root.width - width - 10
        y: (root.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: root
            function onPressedChanged(){
                canvas.requestPaint()
            }
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = indicatorColor
            context.fill();
        }
    }

    contentItem: Item {
        width: root.background.width - root.indicator.width - 10
        height: root.background.height

        RowLayout {
            anchors.fill: parent
            spacing: 10
            Label {
                opacity: 0.87
                font.family: fontName
                font.pixelSize: isBold ? fontSize : fontSize
                font.bold: isBold ? Font.Bold : Font.Normal
                font.weight: isBold ? Font.Bold : Font.Normal
                text: model.get(currentIndex).name
                Layout.fillWidth: true
                verticalAlignment: Image.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
                elide: Text.ElideRight
                Layout.leftMargin: 10
            }
        }

    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 41
        //color: root.down ? Qt.darker(root.checkedColor, 1.2) : root.checkedColor
        color: bgColor
        radius: 6
        border.width: 0.6
        border.color: "grey"
    }

    popup: Popup {
        y: root.height - 1
        width: root.width * 1.5
        implicitHeight: contentItem.implicitHeight > 250 ? 250 : contentItem.implicitHeight
        padding: 4
        contentItem: ListView {
            leftMargin: 5
            implicitHeight: contentHeight
            keyNavigationEnabled: true
            model: root.popup.visible ? root.delegateModel : null
            clip: true
            focus: true
            currentIndex: root.highlightedIndex
        }

        background: Rectangle {
            anchors.fill: parent
            color: bgColor
            radius: 6
            border.width: 0.6
            border.color: "grey"
            clip: true
        }
    }
}
