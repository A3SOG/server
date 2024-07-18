#include "script_component.hpp"

_mC = "SOG_CfgStores";
_stores = "true" configClasses (missionConfigFile >> "SOG_CfgStores" >> "stores");

{
	private ["_configName", "_className", "_pos", "_dir", "_storeCategories", "_storeRestrictedCategories", "_storeModset", "_storeName", "_storeGoggles", "_storeBackpacks", "_storeItems", "_storeMagazines", "_storeUniforms", "_storeVests", "_storeWeapons", "_storeAircraft", "_storeArmored", "_storeChopper", "_storeMarine", "_storeStatic", "_storeUAV", "_storeUGV", "_storeWheeled", "_store"];
	_configName = configName(_x);
	_className = (missionConfigFile >> _mC >> "stores" >> _configName >> "className") call BIS_fnc_getCfgData;
	_pos = (missionConfigFile >> _mC >> "stores" >> _configName >> "pos") call BIS_fnc_getCfgData;
	_dir = (missionConfigFile >> _mC >> "stores" >> _configName >> "dir") call BIS_fnc_getCfgData;
	_storeCategories = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeCategories") call BIS_fnc_getCfgData;
	_storeRestrictedCategories = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeRestrictedCategories") call BIS_fnc_getCfgData;
	_storeModset = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeModset") call BIS_fnc_getCfgData;
	_storePaymentMethods = (missionConfigFile >> _mC >> "stores" >> _configName >> "storePaymentMethods") call BIS_fnc_getCfgData;
	_storeName = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeName") call BIS_fnc_getCfgData;
	_storeBackpacks = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeBackpacks") call BIS_fnc_getCfgData;
	_storeGoggles = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeGoggles") call BIS_fnc_getCfgData;
	_storeHeadgear = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeHeadgear") call BIS_fnc_getCfgData;
	_storeItems = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeItems") call BIS_fnc_getCfgData;
	_storeMagazines = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeMagazines") call BIS_fnc_getCfgData;
	_storeUniforms = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeUniforms") call BIS_fnc_getCfgData;
	_storeVests = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeVests") call BIS_fnc_getCfgData;
	_storeWeapons = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeWeapons") call BIS_fnc_getCfgData;
	_storeAircraft = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeAircraft") call BIS_fnc_getCfgData;
	_storeArmored = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeArmored") call BIS_fnc_getCfgData;
	_storeChopper = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeChopper") call BIS_fnc_getCfgData;
	_storeMarine = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeMarine") call BIS_fnc_getCfgData;
	_storeStatic = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeStatic") call BIS_fnc_getCfgData;
	_storeUAV = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeUAV") call BIS_fnc_getCfgData;
	_storeUGV = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeUGV") call BIS_fnc_getCfgData;
	_storeWheeled = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeWheeled") call BIS_fnc_getCfgData;

	_store = createSimpleObject[_className, [0, 0, 0]];
	_store setPosATL _pos;
	_store setDir _dir;
	_store allowDamage false;

	diag_log format ["ClassName: %1 Pos: %2 Dir: %3 StoreName: %4", _className, _pos, _dir, _storeName];
	
	_store setVariable ["isStore", [_storeCategories, _storeModset, _storePaymentMethods, _storeName, _storeBackpacks, _storeGoggles, _storeHeadgear, _storeItems, _storeMagazines, _storeUniforms, _storeVests, _storeWeapons, _storeAircraft, _storeArmored, _storeChopper, _storeMarine, _storeStatic, _storeUAV, _storeUGV, _storeWheeled, _storeRestrictedCategories], true];
} forEach _stores;