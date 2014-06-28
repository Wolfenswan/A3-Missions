_pos = _this;

_csat_convoy = [CSAT_CAR1,CSAT_MRAP1,CSAT_MRAP2,CSAT_Tr1,CSAT_Tr2];

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