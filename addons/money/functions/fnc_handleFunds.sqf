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