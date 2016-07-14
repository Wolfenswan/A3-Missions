if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = false;

if !(isServer) exitWith {ws_preInitDone = true};

[] execVM "ha_spottingMarkers.sqf";

asr_ai3_main_radiorange = 0; // Disable ASR AI3 radionet to prevent FIA AI guards to move

if (isNIl "ws_param_hc") then {ws_param_hc = "ws_param_hc" call BIS_fnc_getParamValue;};

ws_preInitDone = true;