import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

RowLayout {
    id:root
    property bool isBold: false
    property string label: "System Theme :"
    property var model: null
    property int currentIndex: 0
    property color fontColor: "#FFFFFF"
    property int fontSize: 14
    property string fontName: "Montserrat"
    property color comboCheckedColor: "#313131"
    property color comboItemSelectColor: Material.accent
    property color comboItemColor: "transparent"
    property color comboBgColor: "grey"
    property color comboIndicatorColor: "white"

    Layout.fillWidth: true
    spacing: 10

    Label {
        width: 150
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        opacity: 0.87
        text:label
        color: fontColor
        font.family: fontName
        font.pixelSize: fontSize
        font.bold: isBold ? Font.Bold : Font.Normal
        font.weight: isBold ? Font.Bold : Font.Normal
        verticalAlignment: Text.AlignVCenter
        Layout.alignment: Qt.AlignVCenter
        elide: Text.ElideRight
        Layout.leftMargin: 10
    }

    PrefsComboBoxLabel{
        checkedColor: comboCheckedColor
        isBold: isBold
        fontName: fontName
        bgItemSelectColor: comboItemSelectColor
        bgItemColor: comboItemColor
        fontColor: fontColor
        fontSize: fontSize
        bgColor: comboBgColor
        property color indicatorColor: "white"
        model: root.model
        currentIndex: root.currentIndex
        onCurrentIndexChanged:root.currentIndex = currentIndex
    }
}
