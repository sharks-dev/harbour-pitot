/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

import "../logic.js" as L
import "../storage.js" as S

Page {
    id: settingsPage

    allowedOrientations: Orientation.All

    ListModel {
        id: units

        ListElement {key: 'mps'; name: ''}
        ListElement {key: 'mpm'; name: ''}
        ListElement {key: 'kph'; name: ''}
        ListElement {key: 'mph'; name: ''}
        ListElement {key: 'fps'; name: ''}
        ListElement {key: 'knt'; name: ''}
    }

    Component.onCompleted: {
        var savedUnit = S.readSetting(S.connect(), 'speed_unit', 'mps');

        for (var i = 0; i < units.count; ++i) {
            var item = units.get(i);

            if (item.key === savedUnit) {
                unitBox.currentIndex = i;
            }

            item.name = L.UNITS[item.key].name;
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            anchors.fill: parent

            PageHeader {
                title: qsTr('Settings')
            }

            ComboBox {
                id: unitBox

                label: qsTr('Display unit')

                menu: ContextMenu {
                    Repeater {
                        id: unitMenuRepeater

                        model: units

                        delegate: MenuItem {
                            text: name
                        }
                    }
                }

                onValueChanged: {
                    var unit = units.get(currentIndex).key;

                    S.storeSetting(S.connect(), 'speed_unit', unit);
                    L.changeUnit(unit);
                }
            }
        }
    }
}
