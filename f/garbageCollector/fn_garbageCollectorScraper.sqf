// F3 - Garbage Collector Scraper
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_body","_wait","_group","_distance","_pos","_nearPlayers","_nearUnits"];

// ====================================================================================

// SET KEY VARIABLES
// The body to remove is passed to this script by the event handler itself. The time to sleep and minimal distance to remove are defined by global variables

_body = _this;
_group = group _this;

if (isNil "f_var_garbageCollectorDelay") then {f_var_garbageCollectorDelay = 60};
if (isNil "f_var_garbageCollectorDistance") then {f_var_garbageCollectorDistance = 100};

_wait = f_var_garbageCollectorDelay;
_distance = f_var_garbageCollectorDistance;

_pos = getPos _body;
_nearPlayers = [objNull];

// ====================================================================================

// WAITING UNTIL ALL CONDITIONS ARE MET
// While there's at least 1 player within the minimal radius around the body the script sleeps the designated time.

_loop = true;
while {_loop} do {
	sleep _wait;
	_loop = [_body,_distance] call f_fnc_nearPlayer;
};


// ====================================================================================

// REMOVE BODY
// Hide and remove the body from the game

hideBody _body;
sleep 5;
deleteVehicle _body;

// ====================================================================================

// REMOVE BODY'S GROUP IF EMPTY
// We wait a while to make sure the body has been removed from the group. Then we count the living units in it and remove the group if it is empty
sleep 0.5;
if (count (units (_group)) == 0) then {deleteGroup _group};



