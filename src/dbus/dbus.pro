TARGET = hudDBus

QT += dbus qml

QT -= gui

TEMPLATE = lib
CONFIG += qt plugin hide_symbols

DEFINES += QT_VERSION_5

target.path = /usr/share/harbour-hud/lib
INSTALLS += target

qmldir.files += $$_PRO_FILE_PWD_/qmldir
qmldir.path +=  $$target.path/harbour/hud/dbus
INSTALLS += qmldir

SOURCES += \
    plugin.cpp \
    declarativedbusadaptor.cpp \
    declarativedbusinterface.cpp

HEADERS += \
    declarativedbusadaptor.h \
    declarativedbusinterface.h

CONFIG(release, debug|release) {
    DEFINES += QT_NO_DEBUG_OUTPUT
}

