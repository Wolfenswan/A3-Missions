/*
 * Creates a cache at desired location.
 * by: harakka
 */

//if (isNil "ha_gen_marker_count") then { ha_gen_marker_count = 0;};

_marker_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"];

_id = _this select 0;
_tentativePos = _this select 1;

// Try to find an empty position for a camo net
_pos = _tentativePos findEmptyPosition [0, 300, "CamoNet_INDP_open_F"];
if (count _pos == 0) then { _pos = _tentativePos };

diag_log format["Creating cache, id: %1, pos: %2", _id, _pos];
_markerName = format["ha_cache_%1", _id];
// Create checkpoint objects
_crate = "Box_IND_Wps_F" createVehicle _pos;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
_crate addItemCargoGlobal ["ItemWatch", 99];
_crate setVariable ["mkrName", _markerName];

_crate addEventHandler [
	"HandleDamage",
	{
	 _crate = _this select 0;
	 _ammoName = _this select 4;

	 if (_ammoName == "DemoCharge_Remote_Ammo") then {
		(_crate getVariable "mkrName") setMarkerType "mil_objective";
		ha_score = ha_score + 1;
		if (ha_score >= ha_param_cacheVictoryNum) then { [1] execVM "f\server\f_mpEndBroadcast.sqf";};
		[["CacheDestroyed", []], "BIS_fnc_showNotification", true, false] spawn BIS_fnc_MP;
	 	_crate setDamage 1;
	 	deleteVehicle _crate;
	 };
	}];

_camonet = "CamoNet_INDP_open_F" createVehicle _pos;
[_pos, west, ["B_G_Soldier_F", "B_G_Soldier_lite_F", "B_G_Soldier_F", "B_G_Soldier_lite_F"],[], [], [0.6,0.6], [], [2, 0.4], random 359] call BIS_fnc_spawnGroup;

// Set marker settings
_marker = createMarker [_markerName, _pos];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_circle";
_marker setMarkerText format[" %1", (_marker_names select _id)];
//ha_gen_marker_count = ha_gen_marker_count + 1;
