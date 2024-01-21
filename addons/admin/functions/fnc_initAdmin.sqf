#include "script_component.hpp"

_mC = "SOG_CfgCpofs";
_cpofs = "true" configClasses (missionConfigFile >> "SOG_CfgCpofs" >> "cpofs");

{
	private ["_configName", "_className", "_pos", "_dir", "_cpof"];
	_configName = configName(_x);
	_className = (missionConfigFile >> _mC >> "cpofs" >> _configName >> "className") call BIS_fnc_getCfgData;
	_pos = (missionConfigFile >> _mC >> "cpofs" >> _configName >> "pos") call BIS_fnc_getCfgData;
	_dir = (missionConfigFile >> _mC >> "cpofs" >> _configName >> "dir") call BIS_fnc_getCfgData;
	_cpofName = (missionConfigFile >> _mC >> "cpofs" >> _configName >> "cpofName") call BIS_fnc_getCfgData;

	_cpof = createSimpleObject[_className, [0, 0, 0]];
	_cpof setPosATL _pos;
	_cpof setDir _dir;
	_cpof allowDamage false;

	diag_log format ["ClassName: %1 Pos: %2 Dir: %3 CPOFName: %4", _className, _pos, _dir, _cpofName];
	
	_cpof setVariable ["isCPOF", [_cpofName], true];
} forEach _cpofs;