if !(isServer) exitWith {};

_box = _this select 0;
_box setDamage 1;
deleteVehicle _box ;

if (isNil "ws_caches_target") then {ws_caches_target = 5};

if (isNil "ws_caches_destroyed") then {ws_caches_destroyed = 0};
ws_caches_destroyed = ws_caches_destroyed + 1; publicVariable "ws_eola_caches_destroyed";

if (ws_caches_destroyed < ws_caches_target ) then {

[[format ["A crate has been destroyed. Crates remaining: %1",(ws_caches_target - ws_caches_destroyed)],"PLAIN"],"BIS_fnc_titleText",true] spawn BIS_fnc_MP;
} else {
["All crates were destroyed!"] call ws_fnc_broadcast;
ws_allCaches_destroyed = true; publicvariable "ws_allCaches_destroyed";
sleep 5;
};