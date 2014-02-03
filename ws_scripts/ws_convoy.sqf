if !(isServer) exitWith {};

//Dynamic convoy
_convoy = [c1,c2,c3,c4,c5,c6,c7,c8];
_center = [ws_convoy,0,0,360,true] call ws_fnc_getPos;
_roads = _center nearRoads 20;
_posarray = [];

if (count _roads < count _convoy) then {
	_x = 25;
		while {((count _roads) < (count _convoy))} do {
			_roads = _center nearRoads _x;
			_x = _x + 5;
	};
};

//Collect positions along road
{
_pos = [_x,2] call ws_fnc_getPos;
_posarray = _posarray + [_pos];
} forEach _roads;

//Place convoy
{
_pos = (_posarray select _forEachIndex);
_x setPos _pos;  _x setDir random 360;_x allowCrewInImmobile true; _x setVectorUp(surfaceNormal(getPos _x));} forEach _convoy;

{_x setPos ([c3,10,6] call ws_fnc_getPos);clearMagazineCargoGlobal _x ; clearWeaponCargoGlobal _x ;clearItemCargoGlobal _x ;_x setVectorUp(surfaceNormal(getPos _x));_x setDir (random 360);} forEach [a1,a2,a3,a4];

{
_x addEventHandler [
	"HandleDamage",
	{
	 _box = _this select 0;
	 _ammoName = _this select 4;

	 if (_ammoName == "DemoCharge_Remote_Ammo") then {
	 	[_box] execVM "ws_scripts\ws_cache_destroyed.sqf";
	 	};
	}];

} forEach [a1,a2,a3,a4,c3];

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

//Attach trigger
{_x setPos (getPos c3);
_x setTriggerArea [10, 10, 0, true];
} forEach [Trg1,Trg2,Trg3,Trg4,Trg5,Trg6,Trg7];

//Create markers
if (isNil "ws_var_jitter") then {ws_var_jitter = paramsArray select 6};
_marker_jitter = [2500,3500];
switch (ws_var_jitter) do {
	case 0: {_marker_jitter = [0,0];};
	case 1: {_marker_jitter = [1500,2500];};
	case 2: {_marker_jitter = [2500,3500];};
	case 3: {_marker_jitter = [3500,5000];};
	default {_marker_jitter = [2500,3500];};
};


_pos = ws_convoy;
while {_pos distance ws_convoy < _marker_jitter select 0} do {
	_pos = [ws_convoy,(_marker_jitter select 1),(_marker_jitter select 0),360,true] call ws_fnc_getPos;
};

_mkr = createMarker ["us_conv",_pos];
_mkr setMarkerType "mil_unknown";
_mkr setMarkerText "Last known location of convoy";
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

{_mkr = createMarker [format["%1",_x],getPos _x];
_mkr setMarkerType "mil_dot";
_mkr setMarkerColor "ColorRed";
_mkr setMarkerAlpha 0;
} forEach [a1,a2,a3,a4];

true