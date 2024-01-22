pragma Singleton // We indicate that this QML Type is a singleton
import QtQuick 2.15
import QtQuick.Controls.Material 2.12

QtObject {
    property bool isDarkMode: true
    readonly property color footerBackground:isDarkMode ? "#0E0E0E" : "#0E0E0E"
    readonly property color headerBackground:isDarkMode ? "transparent" : "white"
    readonly property color backgroundColor: isDarkMode ? "black" : "#efefef"
    readonly property color cardColor: isDarkMode ? "#363640" : "#FFFFFF"
    readonly property color cardBorderColor: isDarkMode ? "#68acd9" : "#9394a5"
    readonly property color fontColor: isDarkMode ? "#FFFFFF" : "#0E0E0E"
    readonly property color textColorValue: isDarkMode ? "white" : "#000000"
    readonly property color textColorCaption: isDarkMode ? "gray" : "#9394a5"

    // gauge color
    readonly property color gaugeBgColor: isDarkMode ? "#1E1E1E" : "#e4e5f1"
    readonly property color gaugeSpeedColor: isDarkMode ? "#32D74B" : "#e4e5f1"
    readonly property color gaugeTextColor: isDarkMode ? "white" : "#9394a5"
    readonly property color gaugeValueColorSmall: isDarkMode ? "white" : "#484b6a"
    readonly property color gaugeValueColorLarge: isDarkMode ? "grey" : "#d2d3db"

    // card color
    readonly property color cardBlinkColor: isDarkMode ? "#737373" : "#e6e6e6"

    // monitor
    readonly property color monitorCardBgColor: isDarkMode ? "#00489eeb" : "#00489eeb"
    readonly property color monitorCardBlinkColor: isDarkMode ? "#8cc3f2" : "#8cc3f2"

    /* Settings screens */
    readonly property color footerColor:"#201f25"
    readonly property color forgroundColor:"#201f25"
    readonly property color buttonColor:"#2f2f39"
    readonly property color labledBackColor:"#2c2c34"
    readonly property color checkedIconColor:"#489eeb"
    readonly property color unCheckedIconColor :"#777781"
    readonly property color progressColor:"#2f2f39"
    readonly property color tileColor :"#439df3"
    readonly property color settingLeftColor: isDarkMode ? "#161616" : "#e7e7e7"
    readonly property color settingRightColor: isDarkMode ? "#202020" : "#f5f5f5"

    /* Settings screens Component */
    readonly property int t1 : 14
    readonly property int t2 : 18
    readonly property color appColor: "#0570eb"
    readonly property color appColorLighter: Qt.lighter("#0570eb")
    readonly property color appColorDarker: Qt.lighter("#0570eb")
    readonly property color systemColor: Material.accent
    readonly property color systemColorLighter: Qt.lighter(Material.accent)
    readonly property color systemColorDarker: Qt.lighter(Material.accent)
    readonly property color transparent: "transparent"
    readonly property color sideBarDarkColor: isDarkMode ? "#313131" : "#f7f7f7"
    readonly property color applicationColor: isDarkMode ? systemColor : appColor
    readonly property color applicationColorLighter: isDarkMode ? systemColorLighter : appColorLighter
    readonly property color applicationColorDarker: isDarkMode ? systemColorDarker : appColorDarker
    readonly property color spinBoxColor: Theme.isDarkMode ? "#313131" : "#dde4de"
    readonly property color textFieldPlaceColor: Theme.isDarkMode ? "#FFFFFF" : "grey"
    readonly property color textFieldColor: Theme.isDarkMode ? "#FFFFFF" : "grey"
    readonly property color sliderCheckedColor: Theme.isDarkMode ? "grey" : "#FFFFFF"
    readonly property color sliderBgColor: Theme.isDarkMode ? "#1c1d21" : "Grey"
    readonly property color comboIndicatorColor: Theme.isDarkMode ? "#white" : "grey"
    readonly property color comboBgColor: Theme.isDarkMode ? "grey" : "#FFFFFF"
    readonly property color comboSelectItemColor: Theme.isDarkMode ? "black" : "grey"
}
