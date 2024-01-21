#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVARMAIN(debugMode) = true;

// Log events
[QGVAR(log), {
	params ["_msg", "_syschatEnabled"];

	[_msg, _syschatEnabled] call FUNC(writeRPT);
}] call CFUNC(addEventHandler);

[COMPONENT_NAME, "DEBUG", "*** DEBUG MODE IS ACTIVE ***", true] call FUNC(log);