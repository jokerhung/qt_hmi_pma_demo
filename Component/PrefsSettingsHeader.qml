import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Label {
    property int fontSize: 14
    property int fontSizeLarge: 16
    property color fontColor: "#FFFFFF"
    property string fontName: "Montserrat"
    width: parent.width
    property bool isBold: true
    Layout.leftMargin: 10
    Layout.fillWidth: true
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    opacity: 0.87
    font.family: fontName
    font.pixelSize: isBold ? fontSizeLarge : fontSize
    font.bold: isBold ? Font.Bold : Font.Normal
    font.weight: isBold ? Font.Bold : Font.Normal
    elide: Text.ElideRight
    color: fontColor
}
