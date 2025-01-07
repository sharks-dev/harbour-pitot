/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: aboutPage

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            width: aboutPage.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("About")
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../../../icons/hicolor/172x172/apps/harbour-pitot.png"
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Pitot 1.0.5"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeLarge
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "© Mikko Ahlroth 2015"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeMedium
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "© Ash Sharkey 2024"
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeMedium
            }

            Separator {
                x: Theme.paddingLarge
                width: parent.width - Theme.paddingLarge * 2
                horizontalAlignment: Qt.AlignCenter
                color: Theme.highlightColor
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Pitot is open source software. You can find the licence details and source code on GitHub.")
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeMedium
                wrapMode: Text.WordWrap
                width: parent.width - Theme.paddingLarge * 2
            }

            Button {
                text: qsTr("Open project website in browser")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: Qt.openUrlExternally("https://github.com/sharks-dev/harbour-pitot/");
            }

            Separator {
                x: Theme.paddingLarge
                width: parent.width - Theme.paddingLarge * 2
                horizontalAlignment: Qt.AlignCenter
                color: Theme.highlightColor
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Sweedish translation by Åke Engelbrektson")
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeMedium
                wrapMode: Text.WordWrap
                width: parent.width - Theme.paddingLarge * 2
            }
        }
    }
}
