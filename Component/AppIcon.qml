import QtQuick 2.15
import QtQuick.Controls 2.15

Label {
    property real size
    property string icon

    font.family: "Montserrat"
    font.pixelSize: size
    font.bold: true
    text: icon
}
