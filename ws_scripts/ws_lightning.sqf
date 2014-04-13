if !(isServer)exitWith {};

_mkrs = [_this] call ws_fnc_collectMarkers;

while {true} do {
	_mkr = _mkrs call ws_fnc_selectRandom;
	[_mkr,"ws_fnc_createLightning",true] call BIS_fnc_MP;
	sleep 10 + random 10;
};