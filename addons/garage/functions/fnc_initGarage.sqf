#include "script_component.hpp"

_mC = "SOG_CfgGarages";
_garages = "true" configClasses (missionConfigFile >> "SOG_CfgGarages" >> "garages");

{
	private ["_configName", "_className", "_pos", "_dir", "_garage"];
	_configName = configName(_x);
	_className = (missionConfigFile >> _mC >> "garages" >> _configName >> "className") call BIS_fnc_getCfgData;
	_pos = (missionConfigFile >> _mC >> "garages" >> _configName >> "pos") call BIS_fnc_getCfgData;
	_dir = (missionConfigFile >> _mC >> "garages" >> _configName >> "dir") call BIS_fnc_getCfgData;
	_garageName = (missionConfigFile >> _mC >> "garages" >> _configName >> "garageName") call BIS_fnc_getCfgData;

	_garage = createSimpleObject[_className, [0, 0, 0]];
	_garage setPosATL _pos;
	_garage setDir _dir;
	_garage allowDamage false;

	diag_log format ["ClassName: %1 Pos: %2 Dir: %3 GarageName: %4", _className, _pos, _dir, _garageName];
	
	_garage setVariable ["isGarage", [_garageName], true];
} forEach _garages;