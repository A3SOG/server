#include "script_component.hpp"

params ["_condition", "_amount"];

switch (_condition) do {
	case ("advance"): {
		companyFunds = companyFunds + _amount;
	};
	case ("deduct"): {
		companyFunds = companyFunds - _amount;
	};
};

publicVariable "companyFunds";

["hsetid", "CompanyState", "funds", -1, [companyFunds], "", "null", false] call dragonfly_db_fnc_addTask;