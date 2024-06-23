// _this spawn db_fnc_listadd;
params [["_key", "", [""]], ["_data", "", [[], "", 0, true]]];

[_key, _data] call dragonfly_db_fnc_listAdd;