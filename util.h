#ifndef UTIL_H
#define UTIL_H

#include <QObject>
#include <QQmlEngine>
#include <QJsonObject>

class Util: public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Util)

    Util() {}

public:
    static QObject *qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine)
    {
        Q_UNUSED(engine);
        Q_UNUSED(scriptEngine);

        return getInstance();
    }

    static Util *getInstance()
    {
        static Util * _instance = 0;
        if ( _instance == 0 ) {
            _instance = new Util();
        }
        return _instance;
    }

    Q_INVOKABLE QList<QString> getAvailableSerialPorts();
    Q_INVOKABLE QString getIpAddress();
    Q_INVOKABLE QJsonObject StringToJson(QString jsonString);
    Q_INVOKABLE QString JsonToString(QJsonObject jsonObj);
};

#endif // UTIL_H
