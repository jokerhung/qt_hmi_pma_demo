import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Component"
import "../Themes"
import "./"
import "./Setting/"

Item {
    readonly property string name: "Setting"

    id:setting
    anchors.fill: parent

    Component{
        id:display
        SettingDisplay{
        }
    }

    Component{
        id:serialPort
        SettingSerialPort{
        }
    }

    Component{
        id:monitor
        SettingMonitor{
        }
    }

    Component{
        id:network
        SettingNetwork{
        }
    }

    function switchPage(index){
        switch(index){
        case 0:
            mainStack.replace(null,display)
            break;
        case 1:
            mainStack.replace(null,serialPort)
            break;
        case 2:
            mainStack.replace(null,monitor)
            break;
        case 3:
            mainStack.replace(null,network)
            break;
        }
    }

    SplitView {
        id: splitView
        anchors.fill: parent
        orientation: Qt.Horizontal

        handle: Item {
            visible: false
        }

        Rectangle {
            id: mainRect
            color: Theme.settingLeftColor
            SplitView.preferredWidth: 250
            SplitView.maximumWidth: 250
            SplitView.minimumWidth: 250

            ListView{
                id:listItemView
                anchors.fill: parent
                anchors.margins: 10
                focus: true
                spacing: 25 // Add spacing here between items
                highlightFollowsCurrentItem :true
                onCurrentIndexChanged: {
                    setting.switchPage(currentIndex)
                }

                highlight: Item{
                    visible: false
                }

                model: SettingSideListModel{}
                delegate: SettingSideListDelegate{
                    width: listItemView.width
                    lightIconRectIcon:iconName
                    darkIconRectIcon:iconName.replace(Qt.resolvedUrl("qrc:/assets/Settings/"), Qt.resolvedUrl("qrc:/assets/Settings/light/"));
                    iconRectColor: iconColor
                    spacing: 50
                    onClicked:{
                        ListView.view.currentIndex = index
                        setting.switchPage(index)
                    }
                }
            }
        }

        Rectangle {
            id: collapsibleRect
            SplitView.fillWidth: true
            color: Theme.settingRightColor
            //color: Theme.cardColor
            clip: true
            Loader{
                id:mainLoader
                anchors.fill: parent
                StackView{
                    id:mainStack
                    anchors.fill: parent
                    initialItem:SettingDisplay{}
                }
            }
        }
    }
}
