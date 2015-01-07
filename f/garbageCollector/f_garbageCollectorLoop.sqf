// F3 - Garbage Collector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN THE SCRIPT ONLY SERVER SIDE

if (!isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_onlyMen","_checkSleep","_check"];

// ====================================================================================

// SET KEY VARIABLES
// Using a common variable, we will create an array containing all men, minus playable units.

_onlyMen = true;   // If true, the GC will only remove infantry bodies but not wrecks
if (isNil "f_var_garbageCollectorMaxBodies") then {f_var_garbageCollectorMaxBodies = 25};	// The maximum amount of bodies which can be present in the mission
if (isNil "f_var_garbageCollectorSleep") then {f_var_garbageCollectorDistance_Sleep = 120}; // How often the GC will check for new bodies to deleted
if (isNil "f_var_garbageCollectorDistance") then {f_var_garbageCollectorDistance = 450};	// The minimal distance to a player for the GC to remove a body

// ====================================================================================

// BEGIN LOOP
// Start the clean-up loop

f_var_garbageCollectorRun = true;

_conveyor = [];

while {f_var_garbageCollectorRun} do {
	sleep f_var_garbageCollectorSleep;
	_check = if (_onlyMen) then [{allDeadMen},{allDead}];

	{
		if !(_x getVariable ["f_var_garbageCollectorIgnore",false]) then {
			_conveyor pushBack _x;
			_x setVariable ["f_var_garbageCollectorIgnore",true];
		};
	} forEach _check;

	/*
	_i = 0;
	while (count _conveyor > f_var_garbageCollectorMaxBodies) do {
		_unit = _conveyor select _i;
		_nearPlayer = [_unit,f_var_garbageCollectorDistance] call f_fnc_nearPlayer;
		if !(_nearPlayer ) then {
			_conveyor deleteAt _i;
			_unit spawn {
				private ["_group"];
				_this
				// If it's an infantry unit hide the body smoothly first
				if (_this isKindOf "CAManBase") then {
					hideBody _this;
					sleep 2.5;
				};
				_group = group _this;
				deleteVehicle _this;
				sleep 0.1;
				if (count (units (_group)) == 0) then {deleteGroup _group};
			};
		} else {_i = _i + 1};
		sleep 0.1;
	};
	*/

	if (count _conveyor > f_var_garbageCollectorMaxBodies) then {
		{
			_nearPlayer = [_unit,f_var_garbageCollectorDistance] call f_fnc_nearPlayer;
			if !(_nearPlayer ) then {
				_x spawn {
					private ["_group"];
					_this
					// If it's an infantry unit hide the body smoothly first
					if (_this isKindOf "CAManBase") then {
						hideBody _this;
						sleep 2.5;
					};
					_group = group _this;
					deleteVehicle _this;
					sleep 0.1;
					if (count (units (_group)) == 0) then {deleteGroup _group};
				};
			};
		} forEach _conveyor;
	};
};