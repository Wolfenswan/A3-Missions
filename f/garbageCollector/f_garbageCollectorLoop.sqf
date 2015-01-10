// F3 - Automatic Garbage Collector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN THE SCRIPT ONLY SERVER SIDE

if (!isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_onlyMen","_checkSleep","_distance","_check"];

// ====================================================================================

// SET KEY VARIABLES
// Using a common variable, we will create an array containing all men, minus playable units.

if (isNil "f_var_garbageCollectorDistance") then {f_var_garbageCollectorDistance = 100};

_onlyMen = false; // If true, the GC will only remove infantry bodies but not wrecks
_checkSleep = 300; // How often the garbage collector checks for bodies to remove
_distance = f_var_garbageCollectorDistance;

// ====================================================================================

// BEGIN LOOP
// Start the clean-up loop

f_var_garbageCollectorRun = true;

while {f_var_garbageCollectorRun} do {
	sleep _checkSleep;
	_check = if (_onlyMen) then [{allDeadMen},{allDead}];

	{
		if !(_x getVariable ["f_var_garbageCollectorIgnore",false]) then {
			_nearPlayer = [_x,_distance] call f_fnc_nearPlayer;
			if !(_nearPlayer ) then {
				_x spawn {
					_group = group _this;

					// If it's an infantry unit hide the body smoothly first
					if (_this isKindOf "CAManBase") then {
						hideBody _this;
						sleep 2.5;
					};
					deleteVehicle _this;
					sleep 0.5;
					if (count (units (_group)) == 0) then {deleteGroup _group};
				};
			};

		};
		sleep 0.1; // Very short sleep to lessen impact on network
	} forEach _check;
};