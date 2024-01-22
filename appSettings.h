#ifndef APPSETTINGS_H
#define APPSETTINGS_H

#include <QSettings>
#include <QCoreApplication>

class AppSettings : public QSettings
{
    Q_OBJECT

public:
    explicit AppSettings(QObject *parent = 0) : QSettings("config.ini", QSettings::IniFormat) {}

    Q_INVOKABLE inline void setValue(const QString &key, const QVariant &value) { QSettings::setValue(key, value); }
    Q_INVOKABLE inline QVariant value(const QString &key, const QVariant &defaultValue = QVariant()) const { return QSettings::value(key, defaultValue); }
    Q_INVOKABLE inline int valueInt(const QString &key, const QVariant &defaultValue = QVariant()) const { return QSettings::value(key, defaultValue).toInt(); }
    Q_INVOKABLE inline QString valueString(const QString &key, const QVariant &defaultValue = QVariant()) const { return QSettings::value(key, defaultValue).toString(); }
};
Q_DECLARE_METATYPE(AppSettings*)

#endif // APPSETTINGS_H
