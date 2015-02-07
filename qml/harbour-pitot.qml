/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.2
import "pages"

import "logic.js" as L

ApplicationWindow
{
    initialPage: Component { MainPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")

    Component.onCompleted: positionSource.start()

    PositionSource {
        id: positionSource

        updateInterval: 1000

        onPositionChanged: {
            L.update(position);
        }
    }
}

