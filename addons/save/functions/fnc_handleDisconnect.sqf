#include "script_component.hpp"

addMissionEventHandler ["HandleDisconnect", {
	_uid = (_this select 2);
	_data = [];

	_data pushBack ["Garage", (_this select 0) getVariable ["Garage", []]];
	_data pushBack ["Locker", (_this select 0) getVariable ["Locker", []]];
	_data pushBack ["Cash", (_this select 0) getVariable ["Cash", 0]];
	_data pushBack ["Cash_Bank", (_this select 0) getVariable ["Cash_Bank", 0]];
	_data pushBack ["Paygrade", (_this select 0) getVariable ["PayGrade", "E1"]];
	_data pushBack ["Holster", [(_this select 0) getVariable ["SOG_Holstered", 0], (_this select 0) getVariable["SOG_Holster", []]]];
	_data pushBack ["Phone_Number", (_this select 0) getVariable ["SOG_Phone_Number", "unk"]];
	_data pushBack ["Email", (_this select 0) getVariable ["SOG_Email", "unk"]];
	_data pushBack ["Rating", rating (_this select 0)];
	_data pushBack ["Position", getPosASLVisual (_this select 0)];
	_data pushBack ["Direction", getDirVisual (_this select 0)];

	if (vehicle (_this select 0) == (_this select 0)) then {
		_data pushBack ["CurrentWeapon", format ["%1", currentMuzzle (_this select 0)]];
		_data pushBack ["Stance", animationState (_this select 0)];
	};

	_data pushBack ["Uniform", uniform (_this select 0)];
	_data pushBack ["Vest", vest (_this select 0)];
	_data pushBack ["Backpack", backpack (_this select 0)];
	_data pushBack ["Goggles", goggles (_this select 0)];
	_data pushBack ["Headgear", headgear (_this select 0)];

	_data pushBack ["PrimaryWeapon", primaryWeapon (_this select 0)];
	_data pushBack ["SecondaryWeapon", secondaryWeapon (_this select 0)];
	_data pushBack ["HandgunWeapon", handgunWeapon (_this select 0)];

	_data pushBack ["PrimaryWeaponItems", primaryWeaponItems (_this select 0)];
	_data pushBack ["SecondaryWeaponItems", secondaryWeaponItems (_this select 0)];
	_data pushBack ["HandgunItems", handgunItems (_this select 0)];

	_data pushBack ["AssignedItems", assignedItems (_this select 0)];

	_MagsUniform = [];
	{
		_mag = _x select 0;
		_ammo = _x select 1;
		if (_ammo > 0) then {
			_MagsUniform pushBack [_mag, 1, _ammo];
		};
	} forEach magazinesAmmoCargo uniformContainer (_this select 0);
	_MagsVest = [];
	{
		_mag = _x select 0;
		_ammo = _x select 1;
		if (_ammo > 0) then {
			_MagsVest pushBack [_mag, 1, _ammo];
		};
	} forEach magazinesAmmoCargo vestContainer (_this select 0);
	_MagsBackpack = [];
	{
		_mag = _x select 0;
		_ammo = _x select 1;
		if (_ammo > 0) then {
			_MagsBackpack pushBack [_mag, 1, _ammo];
		};
	} forEach magazinesAmmoCargo backpackContainer (_this select 0);
	_loadedMags = [];
	{
		_mag = _x select 0;
		_ammo = _x select 1;
		_loaded = _x select 2;
		_type = _x select 3;
		_location = _x select 4;

		if (_loaded && _ammo > 0 && _type != 0) then {
			_loadedMags pushBack [_mag, _ammo];
		};
	} forEach magazinesAmmoFull (_this select 0);

	_data pushBack ["UniformWeapons", (getWeaponCargo uniformContainer (_this select 0)) call sog_server_misc_fnc_cargoToPairs];
	_data pushBack ["UniformItems", (getItemCargo uniformContainer (_this select 0)) call sog_server_misc_fnc_cargoToPairs];
	_data pushBack ["UniformMagazines", _MagsUniform];

	_data pushBack ["VestWeapons", (getWeaponCargo vestContainer (_this select 0)) call sog_server_misc_fnc_cargoToPairs];
	_data pushBack ["VestItems", (getItemCargo vestContainer (_this select 0)) call sog_server_misc_fnc_cargoToPairs];
	_data pushBack ["VestMagazines", _MagsVest];

	_data pushBack ["BackpackWeapons", (getWeaponCargo backpackContainer (_this select 0)) call sog_server_misc_fnc_cargoToPairs];
	_data pushBack ["BackpackItems", (getItemCargo backpackContainer (_this select 0)) call sog_server_misc_fnc_cargoToPairs];
	_data pushBack ["BackpackMagazines", _MagsBackpack];

	_data pushBack ["LoadedMagazines", _loadedMags];

	_key = _uid;
	[_key, str _data] remoteExec ["db_fnc_save", 2, false];
	deleteVehicle (_this select 0);

	profileNamespace setVariable ["Rounds_Fired", rounds_fired];
}];