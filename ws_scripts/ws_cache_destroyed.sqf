if !(isServer) exitWith {};

_box = _this select 0;
_box setDamage 1;
deleteVehicle _box;

if (isNil "ws_caches_destroyed") then {ws_caches_destroyed = 0};
ws_caches_destroyed = ws_caches_destroyed + 1; publicVariable "ws_caches_destroyed";

if (ws_caches_destroyed < 5) then {

	[[format ["A crate has been destroyed. Crates remaining: %1",(5 - ws_caches_destroyed)],"PLAIN"],"BIS_fnc_titleText",true] spawn BIS_fnc_MP;

} else {
	[["All crates were destroyed!","PLAIN"],"BIS_fnc_titleText",true] spawn BIS_fnc_MP;
	ws_allCaches_destroyed = true; publicVariable "ws_allCaches_destroyed";
sleep 5;
};