#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "backend.h"
#include "logutils.h"
#include "util.h"
#include "translator.h"

int main(int argc, char *argv[])
{
    // set input keyboard
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    // init log file
    LOGUTILS::initLogging();

    // load file QML
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    //const QUrl url(QStringLiteral("qrc:/main_test.qml"));

    // Create backend object
    BackEnd backend;

    // load translator
    Translator translator;
    translator.setLanguage(backend.getAppSettings()->valueInt("languageSelect",0));

    // Register class/object to QML
    QQmlContext* ctxt = engine.rootContext();
    ctxt->setContextProperty("backend",&backend);
    ctxt->setContextProperty("staticSettings", backend.getAppSettings());
    ctxt->setContextProperty("Translator", &translator);

    qmlRegisterSingletonType(QUrl("qrc:/Themes/FontStyle.qml"), "FontStyle", 1, 0, "FontStyle");
    qmlRegisterSingletonType<Util>("Util", 1, 0, "Util", &Util::qmlInstance);

    // Show QML file
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
