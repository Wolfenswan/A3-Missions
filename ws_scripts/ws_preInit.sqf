if !(isServer) exitWith {};

if (isNil "ws_initDone") then {ws_initDone = false};
ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if (ws_var_friendly == 1) then {
	west setfriend [resistance,1];
	resistance setfriend [west,1];
};


_markers  = ["mkrConv"] call ws_fnc_collectMarkers;
ws_convoy =  getMarkerPos (_markers call ws_fnc_selectRandom); publicvariable "ws_convoy";

ZEUS_Camera setPosATL ws_convoy;
"mkrCSATBorder" setMarkerPos ws_convoy;
"mkrCSATBorder" setMarkerAlpha 0;

if (isnil "ws_caches_destroyed") then {ws_caches_destroyed = false};publicvariable "ws_caches_destroyed";

_fia = [];

{if (side leader _x == independent && !(leader _x in playableUnits)) then {
	_fia set [count _fia,_x];
};} forEach allGroups;

//Place FIA next to convoy
{
	_pos = [ws_convoy,100] call ws_fnc_getPos;
	{
		_x setPos ([_pos,5] call ws_fnc_getPos);
	} forEach units _x;
Zeus_EdObj synchronizeObjectsAdd (units _x);
} forEach _fia;

//Load US
//{{_x moveInCargo VehBlu_Th1} forEach units _x} forEach [GrpNATO_A1,GrpNATO_CO];
//{{_x moveInCargo VehBlu_Th3} forEach units _x} forEach [GrpNATO_B1];

//Place CSAT
/*
_csat_convoy = [CSAT_CAR1,CSAT_MRAP1,CSAT_MRAP2,CSAT_Tr1,CSAT_Tr2];
if (isNil "ws_var_placement") then {ws_var_placement = paramsarray select 7};
_placement_jitter = [2000,3000];
switch (ws_var_placement) do {
	case 0: {_placement_jitter = [1000,2000];};
	case 1: {_placement_jitter = [2000,3000];};
	case 2: {_placement_jitter = [3000,4000];};
	default {_placement_jitter = [2000,3000];};
};

_pos = ws_convoy;
while {(_pos distance ws_convoy) < (_placement_jitter select 0)} do {
	_pos = [ws_convoy,(_placement_jitter select 1),(_placement_jitter select 0),360,true,false] call ws_fnc_getPos;
};



_roads = _pos nearRoads 20;
_posarray = [];

if ((count _roads) < (count _csat_convoy)) then {
	_x = 25;
		while {((count _roads) < (count _csat_convoy))} do {
			_roads = _pos nearRoads _x;
			_x = _x + 5;
	};
};

//Collect positions along road
{
_pos = [_x,2] call ws_fnc_getPos;
_posarray = _posarray + [_pos];
} forEach _roads;

{
if !(isNil format ["%1",_x]) then {
	_x setPos (_posarray select _forEachIndex);
	_x setDir ([_x,ws_convoy] call BIS_fnc_dirTo);
};
} forEach _csat_convoy;
*/

//Delete unused CSAT vehicles
//{{_x moveInCargo CSAT_Tr1} forEach units _x} forEach [GrpCSAT_A1,GrpCSAT_A2,GrpCSAT_A3];
//{{_x moveInCargo CSAT_Tr2} forEach units _x} forEach [GrpCSAT_B1,GrpCSAT_B2,GrpCSAT_B3];
if (isNil "GrpCSAT_A1" && isNil "GrpCSAT_A2" && isNil "GrpCSAT_A3" && isNil "GrpCSAT_ASL") then {deleteVehicle CSAT_Tr1;};
if (isNil "GrpCSAT_B1" && isNil "GrpCSAT_B2" && isNil "GrpCSAT_B3" && isNil "GrpCSAT_BSL") then {deleteVehicle CSAT_Tr2;};
if (isNil "GrpCSAT_MRAP1") then {deleteVehicle CSAT_MRAP1;};
if (isNil "GrpCSAT_MRAP2") then {deleteVehicle CSAT_MRAP2;};

//Place the convoy
ws_placeconvoy = [] call compile PreprocessFile "ws_scripts\ws_convoy.sqf";


ws_initDone = true;