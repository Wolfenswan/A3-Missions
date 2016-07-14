if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = false;

if !(isServer) exitWith {ws_preInitDone = true};

ws_preInitDone = true;