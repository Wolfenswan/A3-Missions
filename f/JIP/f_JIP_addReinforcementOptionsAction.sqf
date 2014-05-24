// F3 - JIP Add Reinforcement Options Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

<<<<<<< .merge_file_a10128
// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

=======
>>>>>>> .merge_file_a06992
// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_textAction"];

// ====================================================================================

// SET KEY VARIABLES

_unit = _this select 0;
_textAction = localize "STR_f_JIP_reinforcementOptionsAction";

// PREVENT THE JIP AI UNITS FROM FOLLOWING THEIR LEADER/MOVING AWAY
_unit disableAI "move";

// ====================================================================================

// ADD REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We add the action to the player's action menu.

if (_unit == player) then {
<<<<<<< .merge_file_a10128
	F3_JIP_reinforcementOptionsAction = player addaction ["<t color='#dddd00'>" + _textAction + "</t>","f\common\f_JIP_reinforcementOptions.sqf",[],6,true,false,"","_target == player"];
=======
	F3_JIP_reinforcementOptionsAction = player addaction ["<t color='#dddd00'>" + _textAction + "</t>","f\JIP\f_JIP_reinforcementOptions.sqf",[],6,true,false,"","_target == player"];
>>>>>>> .merge_file_a06992
};