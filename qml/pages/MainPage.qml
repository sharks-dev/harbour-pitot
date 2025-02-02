/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.2
// import Nemo.KeepAlive 1.2

Page {
    id: mainPage

    allowedOrientations: Orientation.All
/*
    KeepAlive {
        id: keepAlive
        enabled: keep_alive.value;
    }
*/
    function updateSpeed() {
        realSpeed = currentSpeed * units[speed_unit.value].factor;

        if (isNaN(realSpeed)) {
            speedText.text = '';
            speedUnit.text = qsTr('Getting location. Please ensure location services are enabled…');
            waitIndicator.running = true;
        }
        else {
            speedText.text = realSpeed.toFixed(1);
            speedUnit.text = units[speed_unit.value].name;
            waitIndicator.running = false;
        }
    }

    Component.onCompleted: {
        positionSource.start();
        //updateKeepAlive();
    }

    PositionSource {
        id: positionSource

        active: true

        // Make sure we are using all available positioning methods
        preferredPositioningMethods: PositionSource.AllPositioningMethods

        onPositionChanged: {
            currentSpeed = position.speed;
            updateSpeed();
        }
    }
/*
    function updateKeepAlive() {
        keepAlive.enabled = keep_alive.value;
        DisplayBlanking.preventBlanking = keep_alive.value;
    }
*/
    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr('About')
                onClicked: pageStack.push(Qt.resolvedUrl('AboutPage.qml'))
            }

            MenuItem {
                text: qsTr('Settings')
                onClicked: pageStack.push(Qt.resolvedUrl('SettingsPage.qml'), { mainPageRef: mainPage })
            }
        }

        BusyIndicator {
            id: waitIndicator

            anchors.centerIn: parent
            size: BusyIndicatorSize.Large
        }

        Label {
            id: speedText

            anchors.fill: parent
            anchors.leftMargin: mainPage.width / 8
            anchors.rightMargin: mainPage.width / 8

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: Theme.primaryColor
            font.pixelSize: height * 0.6
            scale: paintedWidth > width? (width / paintedWidth) : 1

            // Avoid jagged edges in font
            renderType: Text.NativeRendering
        }

        Label {
            id: speedUnit

            anchors.fill: parent
            anchors.bottomMargin: mainPage.height / 8

            font.pixelSize: Theme.fontSizeExtraLarge
            color: Theme.secondaryColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBottom
            wrapMode: Text.WordWrap
        }
    }
}
