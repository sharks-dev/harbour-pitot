/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0
import "pages"



ApplicationWindow {
    Item {
        ConfigurationValue {
            id: speed_unit
            key: "/apps/harbour-pitot/settings/speed_unit"
            defaultValue: 'mps'
        }
        ConfigurationValue {
            id: keep_alive
            key: "/apps/harbour-pitot/settings/keep_alive"
            defaultValue: false
        }
    }
    property real currentSpeed: 0
    property var units: {
        // Meters per second
        "mps": { "factor": 1, "name": qsTr("meters per second") },
        // Meters per minute
        "mpm": { "factor": 60, "name": qsTr("meters per minute") },
        // Kilometers per hour
        "kph": { "factor": 3.6, "name": qsTr("kilometers per hour") },
        // Miles per hour
        "mph": { "factor": 2.23693629, "name": qsTr("miles per hour") },
        // Feet per second
        "fps": { "factor": 3.2808399, "name": qsTr("feet per second") },
        // Knots
        "knt": { "factor": 1.943844, "name": qsTr("knots") }
    }
    property real realSpeed: 0


    initialPage: Component { MainPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")


}
