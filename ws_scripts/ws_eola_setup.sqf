//Modify these
//ws_eola_caches_present = 10; // Caches to be placed - overrides parameter
//ws_eola_caches_target = 8;     // Caches that need to be destroyed - overrides parameter
ws_eola_ending = 3;
ws_eola_defenders = opfor;		// Which side is attacking? blufor, opfor or independent.

if (isNil "ws_mkr_array") then {ws_mkr_array = [];};

if (isServer) then {
switch (ws_param_deploy) do {
	case 0: {
		[VehAAF_TH1,GrpAAF_A1,GrpAAF_ASL,GrpAAF_CO,GrpAAF_A2,GrpAAF_A3] call ws_fnc_loadVehicle;
		[VehAAF_TH2,GrpAAF_B1,GrpAAF_BSL,GrpAAF_DC,GrpAAF_B2,GrpAAF_B3] call ws_fnc_loadVehicle;
		[VehAAF_TH3,GrpAAF_C1,GrpAAF_CSL,GrpAAF_C2,GrpAAF_C3] call ws_fnc_loadVehicle;
	};

	case 1: {
		[Veh_Tr1,GrpAAF_A1,GrpAAF_ASL,GrpAAF_CO,GrpAAF_A2,GrpAAF_A3] call ws_fnc_loadVehicle;
		[Veh_Tr2,GrpAAF_B1,GrpAAF_BSL,GrpAAF_DC,GrpAAF_B2,GrpAAF_B3] call ws_fnc_loadVehicle;
		[Veh_Tr3,GrpAAF_C1,GrpAAF_CSL,GrpAAF_C2,GrpAAF_C3] call ws_fnc_loadVehicle;
	};
};

_markers = ["mkrEolaCache"] call ws_fnc_collectMarkers;

if (isNil "ws_fnc_selectrandom") then {
	ws_fnc_selectrandom = {_selection = _this select (floor (random (count _this)));_selection};
};

ws_cache_array = [];
for "_x" from 1 to ws_eola_caches_present do {
	_mkr = _markers call ws_fnc_selectRandom; _markers = _markers - [_mkr];
	_pos = getMarkerPos _mkr;
	_box = "O_supplyCrate_F" createVehicle _pos;
	if (str(getPos _box) != str(_pos)) then {_mkr setMarkerPos (getPos _box)}; //If the box can't be placed on the markers location, move the marker to the box's new location

	ws_cache_array = ws_cache_array + [_box];
	clearMagazineCargoGlobal _box; clearWeaponCargoGlobal _box; clearItemCargoGlobal _box;

	_box addEventHandler [
	"HandleDamage",
	{
	 _box = _this select 0;
	 _ammoName = _this select 4;

	 if (_ammoName == "DemoCharge_Remote_Ammo") then {
	 	[_box] execVM "ws_scripts\ws_eola_cache_destroyed.sqf";
	 	};
	}];
};

// This doesn't work because of a bug with marker locality
//{[["mil_triangle","ColorWhite",[format ["%1",_x]],getPos _x],"BIS_fnc_markerCreate",opfor,true] spawn BIS_fnc_MP;  } forEach ws_cache_array;

	{
		_mkr = createMarker [format ["%1",_x],getPos _x];
		_mkr setMarkerColor "ColorWhite";
		_mkr setMarkerType "mil_triangle";
		_mkr setMarkerAlpha 0;
		ws_mkr_array = ws_mkr_array + [_mkr];
	} forEach ws_cache_array;

publicVariable "ws_mkr_array";

};

