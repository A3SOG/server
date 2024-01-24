#include "script_component.hpp"

diag_log "Executing SOG Server Side Functions...";

// Players
[] call sog_server_save_fnc_handleDisconnect;
diag_log "Server Handle Disconnect Initialized.";

// Server
["load"] call sog_server_init_fnc_handleServerState;
diag_log "Server Handle Server State Initialized.";

true spawn {
	if (((configFile >> "CfgPatches" >> "sog_server_main" >> "serverSaveLoop") call BIS_fnc_getCfgData) == 0) exitWith { diag_log "Server Save Disabled"; };
	while { true } do {
		sleep ((configFile >> "CfgPatches" >> "sog_server_main" >> "serverSaveLoopTime") call BIS_fnc_getCfgData);
		["save"] spawn sog_server_init_fnc_handleServerState;
	};
};