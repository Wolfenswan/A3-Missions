<<<<<<< .merge_file_a04324
// F3 - Multiplayer Ending Controller 
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_validEndings"];
=======
// F3 - Multiplayer Ending Controller
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_ending","_state"];

_ending = _this select 0;
_state = if (count _this > 1) then {_this select 1} else {true};
>>>>>>> .merge_file_a04572

// ====================================================================================

// SERVER DELAY
// If this script is executing on the server a small delay is used.

if (isServer) then
{
	sleep 3;
// DEBUG
	if (f_var_debugMode == 1) then
	{
<<<<<<< .merge_file_a04324
		player sideChat "DEBUG (f\server\f_mpEndReceiver.sqf): This is the server.";
=======
		player sideChat "DEBUG (f_fnc_mpEndReciever): This is the server.";
>>>>>>> .merge_file_a04572
	};
};

// DEBUG
if (f_var_debugMode == 1) then
{
<<<<<<< .merge_file_a04324
	player sideChat format ["DEBUG (f\server\f_mpEndReceiver.sqf): f_endSelected = %1",f_endSelected];
=======
	player sideChat format ["DEBUG (f_fnc_mpEndReciever): _ending = %1, _state = %2",_ending,_state];
>>>>>>> .merge_file_a04572
};

// ====================================================================================

// CLEAN-UP OBJECTIVES & TRIGGER CUT-SCENES ETC.
// This is an opportunity to set all objectives to pass/fail, trigger cut-scenes etc.
// depending on the ending that has been selected. Initially, we identify the desired
<<<<<<< .merge_file_a04324
// ending using the value of f_endSelected. If an invalid value for f_endSelected has
// been broadcast a sidechat will be displayed and the script will exit (allowed values
// are: 1,2,3,4,5,6).

_validEndings = [1,2,3,4,5,6];
if (!(f_endSelected in _validEndings)) then 
{
	player sideChat format ["DEBUG (f\common\f_mpEndReciever.sqf): f_endSelected = %1 (INVALID)",f_endSelected];
	exit; 	
};

switch (f_endSelected) do
=======
// ending using the parsed value. By default allowed values are: 1,2,3,4,5,6.


switch (_ending) do
>>>>>>> .merge_file_a04572
{
// Ending #1
	case 1:
	{
// Place any custom code for ending #1 after this line:



// Do not allow custom code for ending #1 to continue after this comment.
<<<<<<< .merge_file_a04324
	"end1" call BIS_fnc_endMission;					
=======
>>>>>>> .merge_file_a04572
	};
// Ending #2
	case 2:
	{
// Place any custom code for ending #2 after this line:



// Do not allow custom code for ending #2 to continue after this comment.
<<<<<<< .merge_file_a04324
	"end2" call BIS_fnc_endMission;	
=======
>>>>>>> .merge_file_a04572
	};
// Ending #3
	case 3:
	{
// Place any custom code for ending #3 after this line:



// Do not allow custom code for ending #3 to continue after this comment.
<<<<<<< .merge_file_a04324
	"end3" call BIS_fnc_endMission;
=======
>>>>>>> .merge_file_a04572
	};
// Ending #4
	case 4:
	{
// Place any custom code for ending #4 after this line:



// Do not allow custom code for ending #4 to continue after this comment.
<<<<<<< .merge_file_a04324
	"end4" call BIS_fnc_endMission;	
=======
>>>>>>> .merge_file_a04572
	};
// Ending #5
	case 5:
	{
// Place any custom code for ending #5 after this line:



// Do not allow custom code for ending #5 to continue after this comment.
<<<<<<< .merge_file_a04324
	"end5" call BIS_fnc_endMission;	
=======
>>>>>>> .merge_file_a04572
	};
// Ending #6
	case 6:
	{
// Place any custom code for ending #6 after this line:



// Do not allow custom code for ending #6 to continue after this comment.
<<<<<<< .merge_file_a04324
	"end6" call BIS_fnc_endMission;	
	};
};

=======
	};

// Default
	default {

	};
};

// Using the integer we've got we use format to compile a string (e.g. "end1") and call the BIS function with it.
_ending = format ["end%1",_ending];
[_ending,_state] call BIS_fnc_endMission;

>>>>>>> .merge_file_a04572
// ====================================================================================

// EXIT THE SPECTATOR SCRIPT IF IS OPEN
// Clients just "hang" if the mission has ended but are still inside the
// spectator script.
if (dialog) then
{
	closeDialog 0;
};

// ====================================================================================

<<<<<<< .merge_file_a04324
if (true) exitWith {};
=======
>>>>>>> .merge_file_a04572
