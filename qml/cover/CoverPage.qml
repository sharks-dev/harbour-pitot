/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Timer {
        // kinda bodge-y to run a timer like this, but it works.
        id: timer
        repeat: true
        interval: 500

        onTriggered: {
            if (isNaN(realSpeed)) {
                waitIndicator.running = true;
                speedText.text = '';
                speedUnit.text = '';
            } else {
                waitIndicator.running = false;
                speedText.text = realSpeed.toFixed(1);
                speedUnit.text = units[speed_unit.value].name;
            }
        }
    }

    Component.onCompleted: {
        timer.start();
    }

    Label {
        id: speedText

        anchors.fill: parent
        anchors.leftMargin: parent.width / 8
        anchors.rightMargin: parent.width / 8

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Theme.primaryColor
        font.pixelSize: height * 0.6
        scale: paintedWidth > width? (width / paintedWidth) : 1

        // Avoid jagged edges in font
        renderType: Text.NativeRendering
    }

    BusyIndicator {
        id: waitIndicator

        anchors.centerIn: parent
        size: BusyIndicatorSize.Large
    }

    Label {
        id: speedUnit

        anchors.fill: parent
        anchors.bottomMargin: parent.height / 8

        font.pixelSize: Theme.fontSizeSmall
        color: Theme.secondaryColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
    }
}


