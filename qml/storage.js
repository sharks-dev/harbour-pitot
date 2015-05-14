/*
 * © Mikko Ahlroth 2015
 * Pitot is open source software. For licensing information, please check
 * the LICENCE file.
 */

.import QtQuick.LocalStorage 2.0 as LS

var db = null;

function connect() {
    if (db !== null) {
        return db;
    }

    db = LS.LocalStorage.openDatabaseSync("Pitot", "1.0", "StorageDatabase", 10240);

    db.transaction(function(tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS settings(key TEXT PRIMARY KEY, value TEXT);");
    });

    return db;
}

function readSetting(db, key, defVal) {
    var setting = null;

    db.readTransaction(function(tx) {
        var rows = tx.executeSql("SELECT value AS val FROM settings WHERE key=?;", [key]);

        if (rows.rows.length !== 1) {
            setting = null;
        }
        else {
            setting = rows.rows.item(0).val;
        }
    });

    if (setting === 'true') {
        setting = true;
    }
    else if (setting === 'false') {
        setting = false;
    }
    // If setting has never been read (doesn't exist), use default value
    else if (setting === null) {
        setting = defVal;
    }

    return setting;
}

function storeSetting(db, key, value) {
    if (value === true) {
        value = 'true';
    }
    else if (value === false) {
        value = 'false';
    }

    db.transaction(function(tx) {
        tx.executeSql("INSERT OR REPLACE INTO settings VALUES (?, ?);", [key, value]);
        tx.executeSql("COMMIT;");
    });
}
