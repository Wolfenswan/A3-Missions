if !(isServer) exitWith {};

//Dynamic convoy
_convoy = [c1,c2,c3,c4,c5,c6,c7,c8];
_center = ws_convoy;
_roads = _center nearRoads 50;
_posarray = [];

if (count _roads < count _convoy) then {
	_x = 25;
		while {((count _roads) < (count _convoy))} do {
			_roads = _center nearRoads _x;
			_x = _x + 5;
	};
};

diag_log "found roads";

//Collect positions along road
{
	_pos = _x call ws_fnc_getEPos;
	_posarray = _posarray + [_pos];
} forEach _roads;

diag_log "calculated roads";

//Place convoy
{
_pos = (_posarray select _forEachIndex);
_x setPos _pos;  _x setDir random 360;_x setVelocity [0, 0, 0]; _x setVectorUp(surfaceNormal(getPos _x));} forEach _convoy;

c3 addEventHandler [
	"HandleDamage",
	{
	 _box = _this select 0;
	 _ammoName = _this select 4;

	 if (_ammoName == "DemoCharge_Remote_Ammo") then {
	 	[_box] execVM "ws_scripts\ws_cache_destroyed.sqf";
	 	};
	}];

//Randomize damage on convoy
{
	_x lockDriver true;
	_x setDamage (0.4+(random 0.2));
	_x setFuel (random 0.4);
	_x setVehicleAmmo (0.5+(random 0.3));
	if (random 1 > 0.3) then {_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "HitLFWheel" >> "name"),1]};
	_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "HitLBWheel" >> "name"),1];
	if (random 1 > 0.3) then {_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "HitRFWheel" >> "name"),1]};
	if (random 1 > 0.5) then {_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "HitRBWheel" >> "name"),1]};
	if (random 1 > 0.3) then {_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "HitGlass1" >> "name"),0.8]};
	if (random 1 > 0.5) then {_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "HitGlass2" >> "name"),0.8]};
	if (random 1 > 0.3) then {_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "HitGlass3" >> "name"),0.8]};
	if (random 1 > 0.5) then {_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "HitGlass4" >> "name"),0.8]};
	_x setHit [getText(configFile >> "cfgVehicles" >> (TypeOf _x) >> "HitPoints" >> "engine"),1];
} forEach _convoy;

//Move trigger
Trg1 setPos (getPos c3);
Trg1 setTriggerArea [10, 10, 0, true];
Trg2 setPos (getPos c3);
Trg2 setTriggerArea [10, 10, 0, true];

//Create markers
//if (isNil "ws_param_jitter") then {ws_param_jitter = "ws_param_jitter" call BIS_fnc_getParamValue;};

_marker_jitter = [1500,2500];

/*
switch (ws_param_jitter) do {
	case 0: {_marker_jitter = [0,0];};
	case 1: {_marker_jitter = [1500,2500];};
	case 2: {_marker_jitter = [2500,3500];};
	case 3: {_marker_jitter = [3500,5000];};
	default {_marker_jitter = [2500,3500];};
};
*/

diag_log "creating markers";

_pos = ws_convoy;
while {_pos distance ws_convoy < (_marker_jitter select 0)} do {
	_pos = [ws_convoy,(_marker_jitter select 1) - 500,(_marker_jitter select 0) - 500] call ws_fnc_getPos;
	//_pos = [ws_convoy,(_marker_jitter select 1) - 500,50] call ws_fnc_NearestRoadPos;
};

_mkr = createMarker ["us_conv",_pos];
_mkr setMarkerType "mil_unknown";
_mkr setMarkerText "Convoy known to be in this area";
_mkr setMarkerColor "ColorRed";
_mkr setMarkerAlpha 0;

_mkr = createMarker ["us_conv1",_pos];
_mkr setMarkerShape "ellipse";
_mkr setMarkerBrush "border";
_mkr setMarkerColor "ColorRed";
_mkr setMarkerSize [(_marker_jitter select 1),(_marker_jitter select 1)];
_mkr setMarkerAlpha 0;

_mkr = createMarker ["fia_conv",getPos c3];
_mkr setMarkerType "mil_destroy";
_mkr setMarkerColor "ColorRed";
_mkr setMarkerAlpha 0;

Zeus_range setPos (getMarkerPos "fia_conv");
Zeus_area synchronizeObjectsAdd [Zeus_range];

diag_log "placed convoy";