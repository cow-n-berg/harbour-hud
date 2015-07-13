    # NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
#TARGET = harbour-hud

#QT += dbus positioning

CONFIG += sailfishapp #mobility

# MOBILITY = positioning

TEMPLATE = subdirs

SUBDIRS = src/dbus src

SOURCES += src/harbour-hud.cpp \
    src/dbus/declarativedbusadaptor.cpp \
    src/dbus/declarativedbusinterface.cpp \
    src/dbus/plugin.cpp

OTHER_FILES += qml/harbour-hud.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SimpleTorchScreenBlank.qml \
    rpm/harbour-hud.spec \
    rpm/harbour-hud.yaml \
    harbour-hud.desktop \
    qml/pages/Speedometer.qml \
    qml/pages/Needle.png \
    qml/pages/Speedometertemp2.png \
    qml/pages/Speedometertempmph.png \
    qml/pages/SimpleTorchScreenBlank.qml

# to disable building translations every time, comment out the
# following CONFIG line
# CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
# TRANSLATIONS += translations/harbour-hud-de.ts

HEADERS += \
    src/dbus/declarativedbusadaptor.h \
    src/dbus/declarativedbusinterface.h

