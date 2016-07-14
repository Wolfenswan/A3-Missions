#include "ws_eola_setup.sqf";

if (isNil "ws_initDone") then {ws_initDone = false};
if (ws_initDone) exitWith {};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

publicVariable "ws_eola_defenders";
publicVariable "ws_eola_ending";

if (isNil "ws_mkr_array") then {ws_mkr_array = [];};

_markers = ["mkrEolaCache"] call ws_fnc_collectMarkers;
if (count _markers < ws_eola_caches_present) then {ws_eola_caches_present = count _markers};

ws_cache_array = [];
for "_x" from 1 to ws_eola_caches_present do {
	_mkr = _markers call ws_fnc_selectRandom; _markers = _markers - [_mkr];
	_pos = [_mkr,true,0,360,false,false] call ws_fnc_getPos;
	_box = "O_supplyCrate_F" createVehicle _pos;

	ws_cache_array = ws_cache_array + [_box];
	clearMagazineCargoGlobal _box; clearWeaponCargoGlobal _box; clearItemCargoGlobal _box; clearBackpackCargoGlobal _box;

	_box addEventHandler [
	"HandleDamage",
	{
	 _box = _this select 0;
	 _ammoName = _this select 4;

	 if (_ammoName == "DemoCharge_Remote_Ammo" || _ammoName == "DemoCharge_Remote_Ammo") then {
	 	[_box] execVM "ws_scripts\ws_eola_cache_destroyed.sqf";
	 	};
	}];
};

 	{
		_mkr = createMarker [format ["%1",_x],getPos _x];
		_mkr setMarkerColor "ColorWhite";
		_mkr setMarkerSize [0.5,0.5];
		_mkr setMarkerType "mil_triangle";
		ws_mkr_array = ws_mkr_array + [_mkr];
		_mkr setMarkerAlpha 0;
	} forEach ws_cache_array;

publicVariable "ws_mkr_array";


ws_initDone = true;