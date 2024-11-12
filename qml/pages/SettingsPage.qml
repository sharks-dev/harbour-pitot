/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: settingsPage

    property Page mainPageRef

    allowedOrientations: Orientation.All

    ListModel {
        id: unitsList

        ListElement {key: 'mps'; name: ''}
        ListElement {key: 'mpm'; name: ''}
        ListElement {key: 'kph'; name: ''}
        ListElement {key: 'mph'; name: ''}
        ListElement {key: 'fps'; name: ''}
        ListElement {key: 'knt'; name: ''}
    }

    Component.onCompleted: {
        var savedUnit = speed_unit.value;

        for (var i = 0; i < unitsList.count; ++i) {
            var item = unitsList.get(i);

            if (item.key === savedUnit) {
                unitBox.currentIndex = i;
            }

            item.name = units[item.key].name;
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

                        model: unitsList

                        delegate: MenuItem {
                            text: name
                        }
                    }
                }

                onValueChanged: {
                    speed_unit.value = unitsList.get(currentIndex).key;
                }
            }
/*
            TextSwitch {
                id: displaySwitch
                text: "Keep display alive"
                checked: keep_alive.value;
                onClicked: { keep_alive.value = displaySwitch.checked; mainPageRef.updateKeepAlive(); }
            }
*/
        }
    }
}
