// _this spawn db_fnc_listadd;
// _this call dragonfly_db_fnc_listAdd;

params [["_key", "", [""]], ["_data", [], [[]]]];

["listadd", _key, "", -1, _data, "", "null", false] call dragonfly_db_fnc_addTask;