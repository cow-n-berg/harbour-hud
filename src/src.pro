TEMPLATE = app

TARGET = harbour-hud
CONFIG += sailfishapp

SOURCES += harbour-hud.cpp

CONFIG(release, debug|release) {
    DEFINES += QT_NO_DEBUG_OUTPUT
}
