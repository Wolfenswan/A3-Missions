if !(isServer)exitWith {};

_mkrs = [_this] call ws_fnc_collectMarkers;

while {true} do {
	_mkr = _mkrs call ws_fnc_selectRandom;
	_mkr call ws_fnc_createLightning;
	sleep 10 + random 10;
};