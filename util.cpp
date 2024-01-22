#include "util.h"
#include <QSerialPortInfo>
#include <QtNetwork>

QList<QString> Util::getAvailableSerialPorts() {
    QList<QString> list;

    Q_FOREACH(QSerialPortInfo port, QSerialPortInfo::availablePorts()) {
        list.append(port.portName());
    }

    return list;
}

QString Util::getIpAddress() {
    QString ipAddress = "";
    const QList<QHostAddress> ipAddressesList = QNetworkInterface::allAddresses();
    // use the first non-localhost IPv4 address
    for (const QHostAddress &entry : ipAddressesList) {
        if (entry != QHostAddress::LocalHost && entry.toIPv4Address()) {
            ipAddress = entry.toString();
            break;
        }
    }

    return ipAddress;
}

QJsonObject Util::StringToJson(QString jsonString)
{
    QByteArray br = jsonString.toUtf8();
    QJsonDocument doc = QJsonDocument::fromJson(br);
    QJsonObject obj = doc.object();
    return obj;
}

QString Util::JsonToString(QJsonObject jsonObj)
{
    QJsonDocument doc(jsonObj);
    QString strJson(doc.toJson(QJsonDocument::Compact));

    return strJson;
}
