#include "script_component.hpp"

_mC = "SOG_CfgBanks";
_banks = "true" configClasses (missionConfigFile >> "SOG_CfgBanks" >> "banks");

{
	private ["_configName", "_className", "_pos", "_dir", "_bank"];
	_configName = configName(_x);
	_className = (missionConfigFile >> _mC >> "banks" >> _configName >> "className") call BIS_fnc_getCfgData;
	_pos = (missionConfigFile >> _mC >> "banks" >> _configName >> "pos") call BIS_fnc_getCfgData;
	_dir = (missionConfigFile >> _mC >> "banks" >> _configName >> "dir") call BIS_fnc_getCfgData;
	_bankName = (missionConfigFile >> _mC >> "banks" >> _configName >> "bankName") call BIS_fnc_getCfgData;

	_bank = createSimpleObject[_className, [0, 0, 0]];
	_bank setPosATL _pos;
	_bank setDir _dir;
	_bank allowDamage false;

	diag_log format ["ClassName: %1 Pos: %2 Dir: %3 BankName: %4", _className, _pos, _dir, _bankName];
	
	_bank setVariable ["isBank", [_bankName], true];
} forEach _banks;