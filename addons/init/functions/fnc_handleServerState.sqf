#include "script_component.hpp"

params ["_condition"];

switch (_condition) do {
	case "save": {
		_data = [];
		_data pushBack ["companyFunds", companyFunds];
		_data pushBack ["companyRating", companyRating];
		_data pushBack ["companyGenerals", companyGenerals];
		// ["SOG_ServerState", str _data] spawn db_fnc_save;
		["SOG_ServerState", _data] call dragonfly_db_fnc_set;
	};
	case "load": {
		// _data = ["SOG_ServerState"] call db_fnc_load;
		["SOG_ServerState", "sog_server_init_fnc_handleServerStateLoad"] call dragonfly_db_fnc_get;
	};
};