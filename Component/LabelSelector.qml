import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

Pane{
    id:control
    padding: 0
    leftInset: 0
    rightInset: 0
    property bool isDarkMode : true
    property string setColors: isDarkMode ? "grey" : "#FFFFFF"
    property real radius: implicitHeight / 2
    property int allowMaxTags: 5
    property var lableList: ["Lable","Lable","Lable"]
    property color fontColor: "#FFFFFF"
    property int currentIndex: 0
    signal indexChanged(int index)

    implicitWidth: layout.implicitWidth
    implicitHeight: 60

    background: Rectangle{
        implicitHeight: control.implicitHeight
        implicitWidth: control.implicitWidth
        color: isDarkMode ? "#1c1d21" : "Grey"
        radius: control.radius
    }

    RowLayout{
        id:layout
        spacing: 0
        anchors{
            verticalCenter: parent.verticalCenter
        }

        Repeater {
            id:rep
            Layout.alignment: Qt.AlignHCenter
            width: parent.width
            model: lableList

            delegate: RadioButton {
                id: labelIndicator
                padding: 0
                checked: currentIndex === index
                indicator: Item{ }

                contentItem: Rectangle{
                    implicitHeight: control.implicitHeight - 1
                    implicitWidth: tags.implicitWidth + 106
                    radius: control.radius
                    color: labelIndicator.checked ? setColors : "transparent"

                    HoverHandler{
                        id: tagHovered
                    }

                    Label {
                        id:tags
                        text: modelData
                        font.pixelSize: 20
                        font.family: "Montserrat"
                        color: fontColor
                        anchors.centerIn: parent
                    }
                }

                onClicked: {
                    currentIndex = index
                    control.indexChanged(index)
                }
            }
        }
    }
}
