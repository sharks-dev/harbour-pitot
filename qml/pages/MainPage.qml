/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

import "../logic.js" as L

Page {
    id: mainPage

    allowedOrientations: Orientation.All

    function updateSpeed(speed, unit) {
        var realSpeed = L.convertSpeed(speed);

        if (realSpeed < 0) {
            speedText.text = '';
            speedUnit.text = qsTr('Getting location…');
            waitIndicator.running = true;
        }
        else {
            speedText.text = realSpeed.toFixed(1);
            speedUnit.text = unit.name;
            waitIndicator.running = false;
        }
    }

    Component.onCompleted: {
        L.addUpdateListener(updateSpeed);
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr('About')
                onClicked: pageStack.push(Qt.resolvedUrl('AboutPage.qml'))
            }

            MenuItem {
                text: qsTr('Settings')
                onClicked: pageStack.push(Qt.resolvedUrl('SettingsPage.qml'))
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
        }
    }
}
