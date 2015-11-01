if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

// Get good wreck location
private ["_mkrs","_mkr","_pos"];
_mkrs = ["mkrArea"] call ws_fnc_collectMarkers;
{_x setMarkerAlpha 0;} forEach _mkrs;
_mkr = _mkrs call ws_fnc_selectRandom;

_pos = [([_mkr,true] call ws_fnc_getPos), 0, 1000, 5, 0, 0, 0] call BIS_fnc_findSafePos;

ws_wreckLoc = [_pos select 0,_pos select 1,0]; publicVariable "ws_wreckLoc";
//UnitZeus setPosATL [_pos select 0,_pos select 1,50];

// Disable Thermal Imaging for vehicles
// {_x disableTIEquipment true;} forEach [];

// Further tweaking to vehicles
Wreck animateDoor ["door_back_R",1,true];Wreck animateDoor ["door_back_L",1,true];Wreck setCaptive true;

ws_initDone = true; publicVariable "ws_initDone";