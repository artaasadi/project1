QT += core
QT += network
QT -= gui

CONFIG += c++11

TARGET = Game
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += \
    main.cpp \
    ai.cpp

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../external/ChillinClient/release/ -lChillinClient
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../external/ChillinClient/debug/ -lChillinClient
else:unix: LIBS += -L$$OUT_PWD/../external/ChillinClient/ -lChillinClient

INCLUDEPATH += $$PWD/../external/ChillinClient
DEPENDPATH += $$PWD/../external/ChillinClient

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../external/ChillinClient/release/libChillinClient.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../external/ChillinClient/debug/libChillinClient.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../external/ChillinClient/release/ChillinClient.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../external/ChillinClient/debug/ChillinClient.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../external/ChillinClient/libChillinClient.a

RESOURCES += \
    config.qrc

DISTFILES += \
    gamecfg.json \
    ks/commands.ks \
    ks/models.ks

HEADERS += \
    ks/commands.h \
    ks/models.h \
    ai.h \
    effolkronium/random.hpp
