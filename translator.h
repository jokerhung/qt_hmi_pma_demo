#ifndef TRANSLATOR_H
#define TRANSLATOR_H

#include <QObject>
#include <QTranslator>
#include <QString>
#include <QGuiApplication>

class Translator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString textUpdate READ textUpdate NOTIFY languageChanged)
public:
    explicit Translator(QObject *parent = nullptr);

    Q_INVOKABLE void setLanguage(int index);

    QString textUpdate()
    {
        return "";
    }

signals:
    void languageChanged();

private:
    QString m_textUpdate;
    QTranslator m_translator;
    QGuiApplication *m_App;
};

#endif // TRANSLATOR_H
