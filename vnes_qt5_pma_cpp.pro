QT += quick serialport virtualkeyboard

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        backend.cpp \
        logutils.cpp \
        main.cpp \
        tcpcmd.cpp \
        tcpserver.cpp \
        tcpthread.cpp \
        translator.cpp \
        util.cpp

RESOURCES += qml.qrc

TRANSLATIONS += translate_en.ts \
                translate_vn.ts
CONFIG += lrelease
CONFIG += embed_translations

DISTFILES += translate_en.qm \
             translate_vn.qm

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    appSettings.h \
    backend.h \
    logutils.h \
    tcpcmd.h \
    tcpserver.h \
    tcpthread.h \
    translator.h \
    util.h

target.path = /home/pi/VNES/bin
INSTALLS += target
