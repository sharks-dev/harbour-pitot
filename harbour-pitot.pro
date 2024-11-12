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
TARGET = harbour-pitot

CONFIG += sailfishapp

SOURCES += src/harbour-pitot.cpp

DISTFILES += qml/harbour-pitot.qml \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/AboutPage.qml \
    rpm/harbour-pitot.changes \
    rpm/harbour-pitot.spec \
    translations/*.ts \
    icons/172x172/harbour-pitot.png \
    harbour-pitot.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
