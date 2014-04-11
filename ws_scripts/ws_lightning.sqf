if !(isServer)exitWith {};

_mkrs = [_this] call ws_fnc_collectMarkers;

{
	_mkr = _mkrs call ws_fnc_selectRandom;
	_mkr call ws_fnc_createLightning;
	sleep 10 + random 10;
} forEach _mkrs;