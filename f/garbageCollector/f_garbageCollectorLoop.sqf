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

_onlyMen = true;   // If true, the GC will only remove infantry bodies but not wrecks
if (isNil "f_var_garbageCollectorMaxBodies") then {f_var_garbageCollectorMaxBodies = 25};	// The maximum amount of bodies which can be present in the mission
if (isNil "f_var_garbageCollectorSleep") then {f_var_garbageCollectorDistance_Sleep = 300}; // How often the GC will check for new bodies to deleted
if (isNil "f_var_garbageCollectorDistance") then {f_var_garbageCollectorDistance = 450};	// The minimal distance to a player for the GC to remove a body

// ====================================================================================

// BEGIN LOOP
// Start the clean-up loop

f_var_garbageCollectorRun = true;

while {f_var_garbageCollectorRun} do {
	sleep f_var_garbageCollectorSleep;

	private ["_check","_c"];

	// Create a local copy of the global arrays containing all dead/destroyed units
	_check = if (_onlyMen) then [{allDeadMen},{allDead}];

	if (count _check > f_var_garbageCollectorMaxBodies) then {

		_c = 0;
		{
			private ["_unit"];
			_unit = _x;

			// Only delete the unit if it's not set to be ignored and no player is in the given distance
			if !(_unit getVariable ["f_var_garbageCollectorIgnore",false] && {!([_unit,f_var_garbageCollectorDistance] call f_fnc_nearPlayer)}) then {

				_c = _c + 1;	// Count how many bodies have been deleted
				_unit spawn {
						private ["_group"];
						// If it's an infantry unit hide the body first
						if (_this isKindOf "CAManBase") then {
							hideBody _this;
							uisleep 2.5;
						};

						_group = group _this;
						deleteVehicle _this;
						uisleep 0.1;

						// Remove the unit's group if it is now empty
						if (count (units (_group)) == 0) then {deleteGroup _group};
					};
				};

			uisleep 0.1;

			// If enough bodies have been deleted to reduce the array length enough, exit the count loop
			if (count _check - _c <= f_var_garbageCollectorMaxBodies) exitWith {};

		} count _check; // Using count instead of forEach is slightly faster but functionally identical

	};

};