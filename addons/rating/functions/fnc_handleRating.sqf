#include "script_component.hpp"

params ["_condition", "_amount"];

diag_log format ["Condition: %1 /n Amount: %2 /n Company Rating: %3", _condition, _amount, companyRating];

switch (_condition) do {
	case ("advance"): {
		companyRating = companyRating + _amount;
	};
	case ("deduct"): {
		companyRating = companyRating - _amount;
	};
};

publicVariable "companyRating";

["hsetid", "CompanyState", "rating", -1, [companyRating], "", "null", false] call dragonfly_db_fnc_addTask;