// F3 - Automatic Garbage Collector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN THE SCRIPT ONLY SERVER SIDE

if (!isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

// ====================================================================================

// SET KEY VARIABLES
// Using a common variable, we will create an array containing all men, minus playable units.

_onlyMen = true; // If true, the GC will only remove infantry bodies but not wrecks
_checkSleep = 5; // How often the garbage collector checks for bodies to remove

// ====================================================================================

// BEGIN LOOP
// Start the clean-up loop

f_var_garbageCollectorRun = true;

while {f_var_garbageCollectorRun} do {
	sleep _checkSleep;
	_check = if (_onlyMen) then [{allDeadMen},{allDead}]
	{
		if !(getVariable ["f_var_garbageCollectorIgnore",false]) then {
			_x spawn f_fnc_garbageCollectorRemoveBody;
			sleep 0.5;
		};
	} count _check;
};