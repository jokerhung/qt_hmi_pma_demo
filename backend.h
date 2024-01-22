#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QQmlEngine>
#include <qqml.h>
#include <QtSerialPort/QSerialPort>
#include <QtSerialPort/QSerialPortInfo>
#include <QTimer>
#include <QThread>
#include "appSettings.h"
#include "tcpserver.h"

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString data READ data WRITE setData NOTIFY dataChanged)
    Q_PROPERTY(QString serial READ serial WRITE setSerial NOTIFY serialChanged)
    Q_PROPERTY(QString fan READ fan WRITE setFan NOTIFY fanChanged)
    QML_ELEMENT

public:
    explicit BackEnd(QObject *parent = nullptr);
    ~BackEnd();

    QString data();
    void setData(const QString &data);

    QString serial();
    void setSerial(const QString &status);

    QString fan();
    void setFan(const QString &status);

    AppSettings* getAppSettings();
    void setAppSettings(AppSettings* appSettings);

    Q_INVOKABLE void power(int state);
    Q_INVOKABLE void setFan(int speed);
    Q_INVOKABLE void updateSettings();

signals:
    void dataChanged();
    void serialChanged();
    void fanChanged();
    void settingsChanged();

public slots:
    void processTcpRequest(qintptr socketDescriptor, const QString &req);

private:
    QString m_data;
    QString m_serialportname;
    QString m_serial;
    QString m_fan;
    QString m_settingsString;
    int m_powerState;
    int m_powerOldState;
    int m_fanSpeed;
    int m_monitorInterval;
    AppSettings* m_pAppSettings;
    TcpServer m_tcpServer;
    QString m_currentJsonSensor;

    void UpdateGUI_SensorData(const QString &s);
    void UpdateGUI_PowerState(int state);
    void UpdateGUI_FanSpeed(int speed);
};

#endif // BACKEND_H
