if (!isServer) exitWith {};
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";

ha_score = 0;

_startTime = diag_tickTime;
_cacheDistMin = 200;		// Min distance for generating new cache
_cacheDistMax = 600;		// Max distance for generating new cache
_spawnMinSideDistance = 8000;		// Min distance sides spawn from one another
_spawnDefenderMinCacheDistance = 100;	// Min distance for defender to spawn from any cache
_spawnDefenderMaxCacheDistance = 400;	// Max distance for defender to spawn from any cache
_spawnAttackerMinCacheDistance = 500;	// Min distance for attacker to spawn from any cache
_spawnAttackerMaxCacheDistance = 1000;		// Max distance for attacker to spawn from any cache
_cacheNum = 5;		// Number of waypoints
_cacheList = [];	// List of all cache coordinates
_blacklist = ["mkr_blacklist"] call ws_fnc_collectMarkers;	// List of area markers where caches won't spawn

// Find position of first cache
_cacheList = _cacheList + [["mkr_playArea", false, _blacklist] call SHK_pos];

// Find rest of cache positions one by one (starting from 2, since we already added 1)
_cacheCur = _cacheList select 0;
for "_i" from 2 to _cacheNum do {
	_cacheNext = ["mkr_playArea", false, _blacklist] call SHK_pos;
	_debugIterations = 0;
	while {_cacheCur distance _cacheNext < _cacheDistMin || {_cacheCur distance _cacheNext > _cacheDistMax}} do {
		_cacheNext = ["mkr_playArea", false, _blacklist] call SHK_pos;
		_debugIterations = _debugIterations + 1;
	};
	diag_log format["Position %1 found after %2 iterations", _i, _debugIterations];
	_cacheList = _cacheList + [_cacheNext];
};

// Find defender start position
_posDefenderStart = [];
_debugIterations = 0;
while {count _posDefenderStart == 0} do {
	_potentialPos = ["mkr_playArea", false, _blacklist] call SHK_pos;
	{
		if (_potentialPos distance _x >= _spawnDefenderMinCacheDistance && _potentialPos distance _x <= _spawnDefenderMaxCacheDistance) exitWith {
			_posDefenderStart = _potentialPos;
			diag_log format["Defender spawn found after %1 iterations", _debugIterations];
		};
	} forEach _cacheList;
	_debugIterations = _debugIterations + 1;
};

// Find attacker start position
_posAttackerStart = [];
_debugIterations = 0;
while {count _posAttackerStart == 0} do {
	_potentialPos = ["mkr_playArea", false, _blacklist] call SHK_pos;
	{
		if (_potentialPos distance _x >= _spawnAttackerMinCacheDistance && _potentialPos distance _x <= _spawnAttackerMaxCacheDistance && _potentialPos distance _posDefenderStart >= _spawnMinSideDistance) exitWith {
			_posAttackerStart = _potentialPos;
			diag_log format["Attacker spawn found after %1 iterations", _debugIterations];
		};
	} forEach _cacheList;
	_debugIterations = _debugIterations + 1;
};

player globalchat format["Time in ms: %1", diag_tickTime - _startTime];

{
	[_forEachIndex, _x] call compile preprocessFileLineNumbers "ha_serverCreateCache.sqf";
} forEach _cacheList;

// Teleport player groups to start positions
[markerPos "ha_atk_start", _posAttackerStart, 200, ["Man","Car"]] call compile preprocessfilelinenumbers  "shk_moveobjects.sqf";
[markerPos "ha_def_start", _posDefenderStart, 200, ["Man","Car"]] call compile preprocessfilelinenumbers "shk_moveobjects.sqf";