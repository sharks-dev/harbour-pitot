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

    Component.onCompleted: {
        if (positionSource.supportedPositioningMethods === PositionSource.NoPositioningMethods) {
            L.disable(true);
        }

        positionSource.start();
    }

    PositionSource {
        id: positionSource

        updateInterval: 1000

        // Make sure we are using all available positioning methods
        preferredPositioningMethods: PositionSource.AllPositioningMethods

        onPositionChanged: {
            L.update(position);

            if (positionSource.sourceError === PositionSource.ClosedError) {
                L.disable(true);
            }
            else if (positionSource.sourceError === PositionSource.NoError) {
                L.disable(false);
            }
        }
    }
}
