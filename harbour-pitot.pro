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

OTHER_FILES += qml/harbour-pitot.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-pitot.spec \
    rpm/harbour-pitot.yaml \
    translations/*.ts \
    harbour-pitot.desktop \
    rpm/harbour-pitot.changes \
    qml/pages/MainPage.qml \
    qml/logic.js \
    qml/storage.js \
    qml/pages/SettingsPage.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
