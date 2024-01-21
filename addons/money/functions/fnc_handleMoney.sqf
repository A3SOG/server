#include "script_component.hpp"

params ["_condition", "_type", "_amount", "_player"];
private ["_bank", "_cash", "_newBank", "_newCash"];

_bank = _player getVariable ["Cash_Bank", 0];
_cash = _player getVariable ["Cash", 0];

_newBank = 0;
_newCash = 0;

switch (_condition) do {
	case ("advance"): {
		if (_type == "Cash") then {
			_newCash = _cash + _amount;
			_player setVariable ["Cash", _newCash, true];
		};

		if (_type == "Bank") then {
			_newBank = _bank + _amount;
			_player setVariable ["Cash_Bank", _newBank, true];
		};
	};
	case ("deduct"): {
		if (_type == "Cash") then {
			_newCash = _cash - _amount;
			_player setVariable ["Cash", _newCash, true];
		};

		if (_type == "Bank") then {
			_newBank = _bank - _amount;
			_player setVariable ["Cash_Bank", _newBank, true];
		};
	};
};