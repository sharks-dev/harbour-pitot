/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

import "../logic.js" as L

CoverBackground {
    function updateSpeed(speed, unit) {
        var realSpeed = L.convertSpeed(speed);

        if (realSpeed < 0) {
            speedText.text = 'Pitot';
            speedUnit.text = qsTr('Getting location…');
        }
        else {
            speedText.text = speed.toFixed(1);
            speedUnit.text = unit.name;
        }
    }

    Component.onCompleted: {
        L.addUpdateListener(updateSpeed);
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


