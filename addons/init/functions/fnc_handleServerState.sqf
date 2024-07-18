#include "script_component.hpp"

params ["_condition"];

switch (_condition) do {
	case "save": {
		// _data = [];
		// _data pushBack ["companyFunds", companyFunds];
		// _data pushBack ["companyRating", companyRating];
		// _data pushBack ["companyGenerals", companyGenerals];
		// // ["SOG_ServerState", str _data] spawn db_fnc_save;

		private _data = [
		"CompanyState",
		"funds", [companyFunds],
		"rating", [companyRating],
		"operations", [companyGenerals],
		"armory_unlocks", [companyArsenalUnlocks],
		"garage_unlocks", [companyGarageUnlocks]
		];
		["hsetidbulk", "", "", -1, _data, "", "null", false] call dragonfly_db_fnc_addTask;
	};
	case "load": {
		// _data = ["SOG_ServerState"] call db_fnc_load;
		["hgetallid", "CompanyState", "", -1, [], "sog_server_init_fnc_handleServerStateLoad", "null", false] call dragonfly_db_fnc_addTask;
	};
};