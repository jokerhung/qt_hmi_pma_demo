pragma Singleton // We indicate that this QML Type is a singleton
import QtQuick 2.15

QtObject {
    property int totalPower: 240
    property int inputPower: 60
    property double vswr: 1.2
    property int temperature: 70
    property double current: 3
    property int voltage: 120
    property int fanSpeed: 1
    property int p1_temperature: 71
    property double p1_current: 1
    property int p1_voltage: 121
    property int p2_temperature: 72
    property double p2_current: 2
    property int p2_voltage: 122
    property int p3_temperature: 73
    property double p3_current: 3
    property int p3_voltage: 123
    property int p4_temperature: 74
    property double p4_current: 4
    property int p4_voltage: 124
    property int power_state: 1
    property int fan_mode: 0
}
