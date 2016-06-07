// F3 - Casualties Cap
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// WAIT FOR THE MISSION TO START
// A short sleep makes sure the script only starts once the mission is live

sleep 0.1;

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grps","_pc","_end","_started","_remaining","_targets","_alive","_faction","_temp_grp","_temp_grp2","_type","_onlyPlayers","_grpsno","_counter"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables.
// 0: = Side (e.g. BLUFOR), or group name(s) as string array (e.g. ["mrGroup1","myGroup2"])
// 1: = What % of units must be dead before the ending is triggered
// 2: = What ending will be executed. Can also be code.

_targets = _this select 0; // either single group/side or array with group strings or sides
_pc = _this select 1;
_end = _this select 2;

// SET OPTIONAL VARIABLES
// The last two variables are optional, and may not be passed to the script.
// 3: = If only groups with a playable leader slot will be included (default is true)
// 4: = What faction(s) to filter for if the first variable is a side  (e.g. ["blu_f"])

_onlyPlayers = if (count _this > 3) then {_this select 3} else {true};
_faction = if (count _this > 4) then {_this select 4} else {[]};

// ====================================================================================

// COLLECT GROUPS TO CHECK
// If a side variable was passed we collect all relevant groups

_grps = [];

// If only a single side or group was passed put it into an array for further processing
if(typeName _targets =! "ARRAY") then {
	_targets = [_targets];
};

// Loop through the array of _targets
{
	// If it's a side, loop through all groups and add the side's groups to the array
	if (typeName _x == "SIDE") then {
		_side = _x;
		{
			if (side _x == _side) && (_onlyPlayers && (leader _x in playableUnits)) then {
				_grps pushBack _x;
			};
		} forEach allGroups;

	// If group names were passed we need to turn them from strings into objects
	} else {
		_Tgrp = call compile format ["%1",_x];
		if(!isnil "_Tgrp") then
		{
			_grps pushBack _x;
		};
	};
} forEach _targets;

// Filter all non-player groups
if (_onlyPlayers) then {
	{
		if ({_x in playableUnits} count units _grp == 0) then
		{
			_grps = _grps - [_x];
		};
	} forEach _grps;
};

// Filter the created group array for the factions
if(count _faction > 0) then
{
	{
		if !(faction (leader _x) in _faction) then
		{
			_grps = _grps - [_x];
		};
	} forEach _grps;
};

// ====================================================================================

// FAULT CHECK
// 5 seconds into the mission we check if any groups were found. If not, exit with an error message

sleep 5;

if (count _grps == 0) exitWith {
	player GlobalChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): No groups found, _targets = %1, _grps = %2",_targets,_grps];
};

// ====================================================================================

// CREATE STARTING VALUES
// A count is made of units in the groups listed in _grps.

_started = 0;
{_started = _started + (count (units _x))} forEach _grps;

// DEBUG
if (f_param_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): _started = %1",_started];
};

// ====================================================================================

// CHECK IF CASUALTIES CAP HAS BEEN REACHED OR EXCEEDED
// Every 6 seconds the server will check to see if the number of casualties sustained
// within the group(s) has reached the percentage specificed in the variable _pc. If
// the cap has been reached, the loop will exit to trigger the ending.

while {true} do
{
	_remaining = 0;

	// Calculate how many units in the groups are still alive
	{
	  _grp = _x;
	  _alive = {alive _x} count (units _grp);
	  _remaining = _remaining + _alive;
	} forEach _grps;

// DEBUG
	if (f_param_debugMode == 1) then
	{
		player sideChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): _remaining = %1",_remaining];
	};

	if (_remaining == 0 || ((_started - _remaining) / _started) >= (_pc / 100)) exitWith {};

	sleep 6;
};

// ====================================================================================

// END CASCAP
// Depending on input, either MPEnd or the parsed code itself is called

if (typeName _end == typeName 0) exitWith {
	[_end] call f_fnc_mpEnd;
};

if (typeName _end == typeName {}) exitWith {
	[_end,"bis_fnc_spawn",true] call BIS_fnc_MP;
};

player GlobalChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): Ending didn't fire, should either be code or scalar. _end = %1, typeName _end: %2",_end,typeName _end];