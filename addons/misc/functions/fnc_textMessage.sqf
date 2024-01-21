#include "script_component.hpp"

params ["_target", "_textMessage"];

format ["Incoming Message from Field Commander: \n \n %1", _textMessage] remoteExec ["hint", _target];