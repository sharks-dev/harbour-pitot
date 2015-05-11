/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

.pragma library

.import 'storage.js' as S

var db = S.connect();

// All the units that the speed can be converted into, their
// conversion factors (speed = currentSpeed * factor) and their
// translations
var UNITS = {
    // Meters per second
    mps: {factor: 1, name: qsTr('meters per second')},
    // Meters per minute
    mpm: {factor: 60, name: qsTr('meters per minute')},
    // Kilometers per hour
    kph: {factor: 3.6, name: qsTr('kilometers per hour')},
    // Miles per hour
    mph: {factor: 2.23693629, name: qsTr('miles per hour')},
    // Feet per second
    fps: {factor: 3.2808399, name: qsTr('feet per second')},
    // Knots
    knt: {factor: 1.943844, name: qsTr('knots')}
};

// List of functions that will be called on each location update
// Each function will receive two arguments:
// 1. The current speed in the active unit
// 2. The active unit
var updateListeners = [];

// List of functions that will be called when positioning has been
// disabled or enabled.
// Each function will receive one argument, a boolean false if
// positioning is enabled and true if it is disabled.
var disabledListeners = [];

// The current speed in meters per second
var currentSpeed = 0;

// The current unit displayed
var currentUnit = UNITS[S.readSetting(db, 'speed_unit', 'mps')];

// Is positioning disabled because of no available sources?
var disabled = false;



// Add an update listener which will be called on each location update
function addUpdateListener(listener) {
    updateListeners.push(listener);
}

// Add a disable listener which will be called when positioning is
// disabled or enabled
function addDisabledListener(listener) {
    disabledListeners.push(listener);
}

// Update all listeners with new position data
function update(position) {
    currentSpeed = position.speed;
    _callUpdateListeners();
}

// Change current unit
function changeUnit(unit) {
    currentUnit = UNITS[unit];
    _callUpdateListeners();
}

// Convert internal speed to display speed
function convertSpeed(speed) {
    return speed * currentUnit.factor;
}

// Disable or enable positioning
function disable(newStatus) {
    // Don't change to new status needlessly if that status is already on
    if (newStatus === disabled) {
        return;
    }

    disabled = newStatus;
    _callDisabledListeners();
}

// Call all update listeners
function _callUpdateListeners() {
    for (var i = 0; i < updateListeners.length; ++i) {
        updateListeners[i](currentSpeed, currentUnit);
    }
}

// Call all disable listeners
function _callDisabledListeners() {
    for (var i = 0; i < disabledListeners.length; ++i) {
        disabledListeners[i](disabled);
    }
}
