/* ws_cacheStoreRestore

FEATURE
Uses the F3 caching system as a storage/retrieval system for pre-placed units

USAGE
Add to group leader init:
(group this) setVariable ["ws_cacheStoreRestore","identifier"] - where identifier is a string shared by a the groups you want to store/retrieve at the same time

To store all groups with a specific identifier:
["identifier",true] execVM "ws_cacheStoreRestore.sqf"

To retrieve groups with specific identifier:
["identifier",false] execVM "ws_cacheStoreRestore.sqf"
*/

if !(isServer) exitWith {};

sleep 0.1;

private ["_variable","_store"];

_variable = [_this,0,"any"] call BIS_fnc_param;
_store = [_this,1,false] call BIS_fnc_param;

// If the global variable of all groups to be stored/restored doesn't exist yet, create it and populate it with the relevant groups
if (isNil "ws_cacheStoreRestoreGrps") then {
	ws_cacheStoreRestoreGrps = [];
	{
		if !(_x getVariable ["ws_cacheStoreRestore",""] == "") then {
			ws_cacheStoreRestoreGrps pushBack (_x);
			_x setvariable ["f_cacheExcl",true]; // Mark group to exclude form regular caching
		};
	} forEach allGroups;
};

// Process the array containing all groups to store/restore and set them accordingly
{
	if (_x getVariable ["ws_cacheStoreRestore",""] == _variable) then {
		if (_store) then {
			_x setvariable ["f_cached", true];
             [_x,3] spawn f_fnc_gCache;
		} else {
			 _x setvariable ["f_cached", false];
             _x spawn f_fnc_gUncache;
		};
	};
} forEach ws_cacheStoreRestoreGrps;