#include "script_component.hpp"

params ["_target", "_emailMessage"];

format ["Incoming Email from Field Commander: \n \n %1", _emailMessage] remoteExec ["hint", _target];