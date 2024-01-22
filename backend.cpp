#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>
#include <QRandomGenerator>
#include <QDir>
#include <QMetaType>
#include "backend.h"
#include "util.h"
#include "tcpcmd.h"

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
    // resgister meta type
    qRegisterMetaType<qintptr>("qintptr");
    // load setting from file
    m_pAppSettings = new AppSettings;
    m_currentJsonSensor = "";
    m_powerState = 1;
    m_fanSpeed = 0;
    // create tcp server
    m_tcpServer.startServer(m_pAppSettings->valueInt("networkPort",8080));
    connect(&m_tcpServer, &TcpServer::request, this, &BackEnd::processTcpRequest);
}

BackEnd::~BackEnd()
{
    // free memory
    delete m_pAppSettings;
}

QString BackEnd::data()
{
    return m_data;
}

void BackEnd::setData(const QString &data)
{
    if (data == m_data)
        return;

    m_data = data;
    emit dataChanged();
}

QString BackEnd::serial()
{
    return m_serial;
}

void BackEnd::setSerial(const QString &status)
{
    if (m_serial == status)
        return;

    m_serial = status;
    emit serialChanged();
}

QString BackEnd::fan()
{
    return m_fan;
}

void BackEnd::setFan(const QString &status)
{
    if (m_fan == status)
        return;

    m_fan = status;
    emit fanChanged();
}

AppSettings* BackEnd::getAppSettings()
{
    return m_pAppSettings;
}

void BackEnd::setAppSettings(AppSettings* appSettings)
{
    m_pAppSettings = appSettings;
}

void BackEnd::updateSettings()
{
    // update settings for tcp server
    m_tcpServer.updateSettings(m_pAppSettings->valueInt("networkPort",115200));
}

void BackEnd::power(int state)
{
    if(state == 1) {
        // save old state and change GUI
        m_powerOldState = m_powerState;
        m_powerState = 1;
        UpdateGUI_PowerState(m_powerState);
    } else {
        // save old state and change GUI
        m_powerOldState = m_powerState;
        m_powerState = 0;
        UpdateGUI_PowerState(m_powerState);
    }
}

void BackEnd::setFan(int speed)
{
    m_fanSpeed = speed;
}

void BackEnd::UpdateGUI_SensorData(const QString &s)
{
    setData(s);
}

void BackEnd::UpdateGUI_PowerState(int state)
{
    QJsonObject jsonSensor;
    jsonSensor.insert("power_state", state);
    QJsonDocument doc(jsonSensor);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    setData(strJson);
}

void BackEnd::UpdateGUI_FanSpeed(int speed)
{
    QJsonObject jsonSensor;
    jsonSensor.insert("fanSpeed", speed);
    QJsonDocument doc(jsonSensor);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    setFan(strJson);
}

void BackEnd::processTcpRequest(qintptr socketDescriptor, const QString &req)
{
    TcpCmd m_cmd;
    qDebug() << "backend press tcp request, socket = " << socketDescriptor << req;

    if(req.contains("req.power")) {
        // get request paramter
        QStringList listParam = req.split(" ");
        if(listParam.count() >= 2) {
            QString reqParamString = listParam[1];
            QJsonObject reqParamJson = Util::getInstance()->StringToJson(reqParamString);
            if(reqParamJson["state"] == "OFF") {
                // save current state
                m_powerOldState = m_powerState;
                m_powerState = 0;
                UpdateGUI_PowerState(m_powerState);
                // send response
                m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","success"));
            } else if(reqParamJson["state"] == "ON") {
                // save current state
                m_powerOldState = m_powerState;
                m_powerState = 1;
                UpdateGUI_PowerState(m_powerState);
                // send response
                m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","success"));
            } else {
                m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","Error: invalid parameter"));
            }
        } else {
            m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","Error: invalid parameter"));
        }
    } else if(req.contains("req.fan")) {
        // get request paramter
        QStringList listParam = req.split(" ");
        if(listParam.count() >= 2) {
            QString reqParamString = listParam[1];
            QJsonObject reqParamJson = Util::getInstance()->StringToJson(reqParamString);
            if(reqParamJson["speed"].toInt() >=1 && reqParamJson["speed"].toInt() <=3 ) {
                m_fanSpeed = reqParamJson["speed"].toInt();
                // send response
                m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","success"));
            } else {
                m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","Error: invalid parameter"));
            }
        } else {
            m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","Error: invalid parameter"));
        }
    } else if(req.contains("req.sensor")) {
        // get request paramter
        QStringList listParam = req.split(" ");
        if(listParam.count() >= 2) {
            QString reqParamString = listParam[1];
            UpdateGUI_SensorData(reqParamString);
            // send response
            m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","success"));
        } else {
            m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","Error: invalid parameter"));
        }
    } else {
        qDebug() << "backend press tcp request, not support = " << req;
        m_tcpServer.sendMessage(socketDescriptor,m_cmd.buildTcpResp("resp","Error: invalid request"));
    }
}
