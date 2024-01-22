import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import "../../Component"
import "../../Themes"

Item {
    ColumnLayout{
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 40
        anchors.topMargin: 40
        spacing: 30

        Label {
            text: qsTr("Display") + Translator.textUpdate
            Layout.fillWidth: true
            font.pixelSize: 24
            font.bold: Font.Bold
            font.family: "Montserrat"
            verticalAlignment: Image.AlignVCenter
            Layout.alignment: Qt.AlignVCenter
            color: Theme.fontColor
        }

        ColumnLayout{
            spacing: 10
            Label {
                text: qsTr("Theme")  + Translator.textUpdate
                Layout.fillWidth: true
                font.pixelSize: 20
                font.family: "Montserrat"
                verticalAlignment: Image.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
                color: Theme.fontColor
            }

            LabelSelector{
                lableList:  [qsTr("Dark")+Translator.textUpdate,qsTr("Light")+Translator.textUpdate]
                isDarkMode: Theme.isDarkMode
                fontColor: Theme.fontColor
                currentIndex: staticSettings.valueString("themeSelect",0)
                onIndexChanged: (index) => {
                    Theme.isDarkMode = index === 0 ? true : false
                    staticSettings.setValue("themeSelect", index)
                }
            }
        }

        ColumnLayout{
            spacing: 10
            Label {
                text: qsTr("Language")+Translator.textUpdate
                Layout.fillWidth: true
                font.pixelSize: 20
                font.family: "Montserrat"
                verticalAlignment: Image.AlignVCenter
                Layout.alignment: Qt.AlignVCenter
                color: Theme.fontColor
            }

            LabelSelector{
                lableList:  [qsTr("English")+Translator.textUpdate, qsTr("Vietnamese")+Translator.textUpdate]
                isDarkMode: Theme.isDarkMode
                fontColor: Theme.fontColor
                currentIndex: staticSettings.valueString("languageSelect",0)
                onIndexChanged: (index) => {
                    staticSettings.setValue("languageSelect", index)
                    Translator.setLanguage(index)
                }
            }
        }
    }
}
