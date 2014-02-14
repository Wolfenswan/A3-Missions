if !(isServer) exitWith {};

_box = _this select 0;
_box setDamage 1;
deleteVehicle _box ;

if (isNil "ws_eola_caches_destroyed") then {ws_eola_caches_destroyed = 0};
ws_eola_caches_destroyed = ws_eola_caches_destroyed + 1; publicVariable "ws_eola_caches_destroyed";

if (ws_eola_caches_destroyed < ws_eola_caches_target ) then {

[[format ["A cache has been destroyed. Caches remaining: %1",(ws_eola_caches_target - ws_eola_caches_destroyed)],"PLAIN"],"BIS_fnc_titleText",true] spawn BIS_fnc_MP;
} else {
[["All caches were destroyed!","PLAIN"],"BIS_fnc_titleText",true] spawn BIS_fnc_MP;
sleep 5;
	myEnd = [ws_eola_ending] execVM "f\server\f_mpEndBroadcast.sqf";
};