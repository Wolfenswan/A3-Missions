if (!isServer) exitWith {};
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";

ha_score = 0;
ws_debug = false;

_startTime = diag_tickTime;
_cacheDistMin = 500;				// Min distance for generating new cache
_cacheDistMax = _cacheDistMin*4;				// Max distance for generating new cache
_cacheDistRand = 150; 				//Random factor for cache placement
_spawnMinSideDistance = 2500;		// Min distance sides spawn from one another
_spawnMaxSideDistance = 4000;		// Max distance sides spawn from one another
_spawnDefenderMinCacheDistance = 250;	// Min distance for defender to spawn from any cache
_spawnDefenderMaxCacheDistance = _cacheDistMax + _cacheDistRand;	// Max distance for defender to spawn from any cache
_spawnAttackerMinCacheDistance = 800;	// Min distance for attacker to spawn from any cache
_cacheNum = ha_param_cacheNum;		// Number of waypoints
_cacheList = [];	// List of all cache coordinates
_blacklist = ["mkr_blacklist"] call ws_fnc_collectMarkers;	// List of area markers where caches won't spawn

{_x setMarkerAlpha 0} forEach (_blacklist + ["mkr_playArea"]);

// Find position of first cache
_cacheList = _cacheList + [["mkr_playArea", false, _blacklist] call SHK_pos];

_nmkr = createMarkerLocal [format["mkr_%1",(_cachelist select 0)],(_cachelist select 0)];
_nmkr setMarkerShapeLocal "RECTANGLE";
_nmkr setMarkerSizeLocal [_cacheDistMax*2,_cacheDistMax*2];
_nmkr setMarkerAlphaLocal 0;

// Find rest of cache positions one by one (starting from 2, since we already added 1)
_cacheCur = _cacheList select 0;
for "_i" from 2 to _cacheNum do {
	_cacheNext = [_nmkr, false, _blacklist] call SHK_pos;
	_debugIterations = 0;
	_nearCaches = {_x distance _cacheNext <= _cacheDistMin + random _cacheDistRand - random _cacheDistRand} count _cacheList;
	_farCaches = {_x distance _cacheNext >= _cacheDistMax + random _cacheDistRand - random _cacheDistRand} count _cacheList;
	while {(_nearCaches + _farCaches) > 0} do {
		_cacheNext = [_nmkr, false, _blacklist] call SHK_pos;
		_nearCaches = {_x distance _cacheNext <= _cacheDistMin} count _cacheList;
		_farCaches = {_x distance _cacheNext >= _cacheDistMax} count _cacheList;
		diag_log format ["%1",[_nearCaches,_farCaches]];
		_debugIterations = _debugIterations + 1;
		if (_debugIterations > 1000) exitWith {diag_log "Too long loop"};
	};
	diag_log format["Position %1 found after %2 iterations", _i, _debugIterations];
	_cacheList = _cacheList + [_cacheNext];
};

_nmkr setMarkerSizeLocal [_spawnDefenderMaxCacheDistance*3,_spawnDefenderMaxCacheDistance*3];

// Find defender start position
_posDefenderStart = [];
_debugIterations = 0;
while {count _posDefenderStart == 0} do {
	_potentialPos = [_nmkr, false, _blacklist] call SHK_pos;
	_nearCaches = {_x distance _potentialPos <= _spawnDefenderMinCacheDistance} count _cacheList;
	_farCaches = {_x distance _potentialPos >= _spawnDefenderMaxCacheDistance} count _cacheList;
	if (_nearCaches + _farCaches == 0) exitWith {
		_posDefenderStart = _potentialPos;
		diag_log format["Defender spawn found after %1 iterations", _debugIterations];
	};
	_debugIterations = _debugIterations + 1;
	if (_debugIterations > 500) exitWith {diag_log "Too long loop"};
};

_nmkr setMarkerSizeLocal [_spawnMinSideDistance,_spawnMinSideDistance];

// Find attacker start position
_posAttackerStart = [];
_debugIterations = 0;
while {count _posAttackerStart == 0} do {
	_potentialPos = [_nmkr, false, _blacklist] call SHK_pos;
	_nearCaches = {_x distance _potentialPos <= _spawnAttackerMinCacheDistance} count _cacheList;
	_toonear = _potentialPos distance _posDefenderStart <= _spawnMinSideDistance;
	_toofar = _potentialPos distance _posDefenderStart >= _spawnMaxSideDistance;

	if (_nearCaches == 0 && !_toonear && !_toofar) exitWith {
		_posAttackerStart = _potentialPos;
		diag_log format["Attacker spawn found after %1 iterations", _debugIterations];
	};
	_debugIterations = _debugIterations + 1;
	if (_debugIterations > 500) exitWith {diag_log "Too long loop"};
};


player globalchat format["Time in ms: %1", diag_tickTime - _startTime];


{
	[_forEachIndex, _x] call compile preprocessFileLineNumbers "ha_serverCreateCache.sqf";
} forEach _cacheList;

// Teleport player groups to start positions
[markerPos "ha_atk_start", _posAttackerStart, 200, ["Man","Car"]] call compile preprocessfilelinenumbers  "shk_moveobjects.sqf";
[markerPos "ha_def_start", _posDefenderStart, 200, ["Man","Car"]] call compile preprocessfilelinenumbers "shk_moveobjects.sqf";


[VehFIA_Car1,GrpFIA_CO,GrpFIA_DC] call ws_fnc_loadVehicle;
[VehFIA_Car2,GrpFIA_ASL] call ws_fnc_loadVehicle;
[VehFIA_Car3,GrpFIA_BSL] call ws_fnc_loadVehicle;
[VehFIA_Car4,GrpFIA_CSL] call ws_fnc_loadVehicle;
[VehFIA_Truck1,GrpFIA_A1,GrpFIA_A2,GrpFIA_A3] call ws_fnc_loadVehicle;
[VehFIA_Truck2,GrpFIA_B1,GrpFIA_B2,GrpFIA_B3] call ws_fnc_loadVehicle;
[VehFIA_Truck3,GrpFIA_C1,GrpFIA_C2,GrpFIA_C3] call ws_fnc_loadVehicle;

[VehAAF_Car1,GrpAAF_CO,GrpAAF_DC] call ws_fnc_loadVehicle;
[VehAAF_Truck1,GrpAAF_ASL,GrpAAF_A1,GrpAAF_A2,GrpAAF_A3] call ws_fnc_loadVehicle;
[VehAAF_Truck2,GrpAAF_BSL,GrpAAF_B1,GrpAAF_B2,GrpAAF_B3] call ws_fnc_loadVehicle;
[VehAAF_Truck3,GrpAAF_CSL,GrpAAF_C1,GrpAAF_C2,GrpAAF_C3] call ws_fnc_loadVehicle;