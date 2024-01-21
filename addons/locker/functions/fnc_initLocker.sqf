#include "script_component.hpp"

_mC = "SOG_CfgLockers";
_lockers = "true" configClasses (missionConfigFile >> "SOG_CfgLockers" >> "lockers");

{
	private ["_configName", "_className", "_pos", "_dir", "_locker"];
	_configName = configName(_x);
	_className = (missionConfigFile >> _mC >> "lockers" >> _configName >> "className") call BIS_fnc_getCfgData;
	_pos = (missionConfigFile >> _mC >> "lockers" >> _configName >> "pos") call BIS_fnc_getCfgData;
	_dir = (missionConfigFile >> _mC >> "lockers" >> _configName >> "dir") call BIS_fnc_getCfgData;
	_lockerName = (missionConfigFile >> _mC >> "lockers" >> _configName >> "lockerName") call BIS_fnc_getCfgData;

	_locker = createSimpleObject[_className, [0, 0, 0]];
	_locker setPosATL _pos;
	_locker setDir _dir;
	_locker allowDamage false;

	diag_log format ["ClassName: %1 Pos: %2 Dir: %3 LockerName: %4", _className, _pos, _dir, _lockerName];
	
	_locker setVariable ["isLocker", [_lockerName], true];
} forEach _lockers;