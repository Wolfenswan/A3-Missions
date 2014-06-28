_pos = _this;

_csat_convoy = [CSAT_CAR1,CSAT_Tr1,CSAT_Tr2,CSAT_MRAP1,CSAT_MRAP2];

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
_x allowDamage false;
_x setPosATL (_posarray select _forEachIndex);
_x setDir ([_x,ws_convoy] call BIS_fnc_dirTo);
_x allowDamage true;
} forEach _csat_convoy;

[["MapClickTeleport",[f_var_mapClickTeleport_textDone]],"BIS_fnc_showNotification",east] spawn BIS_fnc_MP;

//Delete unused CSAT vehicles
if (isNil "GrpCSAT_A1" && isNil "GrpCSAT_A2" && isNil "GrpCSAT_A3" && isNil "GrpCSAT_ASL") then {deleteVehicle CSAT_Tr1;};
if (isNil "GrpCSAT_B1" && isNil "GrpCSAT_B2" && isNil "GrpCSAT_B3" && isNil "GrpCSAT_BSL") then {deleteVehicle CSAT_Tr2;};
if (isNil "GrpCSAT_MRAP1") then {deleteVehicle CSAT_MRAP1;};
if (isNil "GrpCSAT_MRAP2") then {deleteVehicle CSAT_MRAP2;};
