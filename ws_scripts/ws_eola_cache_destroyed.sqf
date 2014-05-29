if !(isServer) exitWith {};

_box = _this select 0;
_box setDamage 1;
deleteVehicle _box ;

if (isNil "ws_eola_caches_destroyed") then {ws_eola_caches_destroyed = 0};
ws_eola_caches_destroyed = ws_eola_caches_destroyed + 1; publicVariable "ws_eola_caches_destroyed";

if (ws_eola_caches_destroyed < ws_eola_caches_target ) then {

[
	["CacheDestroyed",
	[format ["Caches left to destroy: %1",(ws_eola_caches_target - ws_eola_caches_destroyed)]]
],"bis_fnc_showNotification",true] spawn BIS_fnc_MP;
} else {
[["MissionEnd",[]],"bis_fnc_showNotification",true] spawn BIS_fnc_MP;
sleep 5;
[ws_eola_ending] call f_fnc_mpEnd;
};