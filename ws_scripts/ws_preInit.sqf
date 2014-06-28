if !(isServer) exitWith {};

if (isNil "ws_initDone") then {ws_initDone = false};
ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if (ws_var_friendly == 1) then {
	west setfriend [resistance,1];
	resistance setfriend [west,1];
};


_markers  = ["mkrConv"] call ws_fnc_collectMarkers;
_mkr = (_markers call ws_fnc_selectRandom);
ws_convoy =  getMarkerPos _mkr; publicvariable "ws_convoy";

diag_log format ["Using %1 @ %2",_mkr,ws_convoy];

ZEUS_Camera setPosATL ws_convoy;
"mkrCSATBorder" setMarkerPos ws_convoy;
"mkrCSATBorder" setMarkerAlpha 0;

switch (ws_var_placement) do {
	case 0: {_placement_jitter = [2000,2000];};
	case 1: {_placement_jitter = [2500,2500];};
	case 2: {_placement_jitter = [3000,3000];};
	case 3: {_placement_jitter = [3500,3500];};
	default {_placement_jitter = [2000,3000];};
};

"mkrCSATBorder" setMarkerSize _placement_jitter;

if (isnil "ws_caches_destroyed") then {ws_caches_destroyed = false};publicvariable "ws_caches_destroyed";

_fia = [];

{if (side leader _x == independent && !(leader _x in playableUnits)) then {
	_fia set [count _fia,_x];
};} forEach allGroups;

//Place FIA next to convoy
{
diag_log format ["Placing %1",_x];
	_pos = [ws_convoy,100] call ws_fnc_getPos;
	{
		_x setPos ([_pos,5] call ws_fnc_getPos);
	} forEach units _x;
Zeus_EdObj synchronizeObjectsAdd (units _x);
} forEach _fia;

//Delete unused CSAT vehicles
if (isNil "GrpCSAT_A1" && isNil "GrpCSAT_A2" && isNil "GrpCSAT_A3" && isNil "GrpCSAT_ASL") then {deleteVehicle CSAT_Tr1;};
if (isNil "GrpCSAT_B1" && isNil "GrpCSAT_B2" && isNil "GrpCSAT_B3" && isNil "GrpCSAT_BSL") then {deleteVehicle CSAT_Tr2;};
if (isNil "GrpCSAT_MRAP1") then {deleteVehicle CSAT_MRAP1;};
if (isNil "GrpCSAT_MRAP2") then {deleteVehicle CSAT_MRAP2;};

//Place the convoy
diag_log format ["Placing convoy"];
ws_placeconvoy = [] call compile PreprocessFile "ws_scripts\ws_convoy.sqf";

diag_log format ["Init done"];
ws_initDone = true;