#include "translator.h"
#include <QDebug>

Translator::Translator(QObject *parent) : QObject(parent)
{

}

void Translator::setLanguage(int index)
{
    qDebug() << "Change language to " << index;

    if(index == 1) {
        m_translator.load(":/i18n/translate_vn.qm");
    } else {
        m_translator.load(":/i18n/translate_en.qm");
    }

    m_App->installTranslator(&m_translator);
    emit languageChanged();
}
