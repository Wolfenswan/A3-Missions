// F3 - JIP Reinforcement Options
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_textAction","_grp","_joinDistance","_loadout"];
<<<<<<< .merge_file_a06392
_joinDistance = 10;

// ====================================================================================

// REMOVE REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We remove the action to the player's action menu.
// NB This is on the assumption that the player has made positive selections and not
// cancelled the menu.

player removeAction F3_JIP_reinforcementOptionsAction;
=======
>>>>>>> .merge_file_a07936

// ====================================================================================

// ALLOW PLAYER TO SELECT GROUP
// Using a dialog we allow the player to select the group s/he is going to [re-]join.

f_var_JIP_state = 0;
<<<<<<< .merge_file_a06392
x = createDialog "GrpPicker";
=======
createDialog "GrpPicker";
>>>>>>> .merge_file_a07936
waitUntil {f_var_JIP_state == 1};
_grp = (player getVariable "f_var_JIP_grp");

// ====================================================================================

// ALLOW PLAYER TO SELECT LOADOUT
// Using a dialog we allow the player to select the loadout s/he requires.

f_var_JIP_state = 2;
<<<<<<< .merge_file_a06392
x = createDialog "KitPicker";
waitUntil {f_var_JIP_state == 3};
_loadout = (player getVariable "f_var_JIP_loadout");
=======
if (f_var_JIP_GearMenu) then {
	createDialog "KitPicker";
	waitUntil {f_var_JIP_state == 3};

	_loadout = (player getVariable "f_var_JIP_loadout");
	[_loadout,player] call f_fnc_assignGear;
};

// ====================================================================================

// REMOVE REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We remove the action to the player's action menu.
// NB This is on the assumption that the player has made positive selections and not
// cancelled the menu.

player removeAction F3_JIP_reinforcementOptionsAction;
F3_JIP_reinforcementOptionsAction = nil;
>>>>>>> .merge_file_a07936

// ====================================================================================

// IMPLEMENT CHOICES
// Using the choices made by the player we implement the desired loadout and set the
// target group for her/him to join.
<<<<<<< .merge_file_a06392

[player] joinSilent grpNull;
nul = [_grp,_joinDistance] execVM "f\common\f_JIP_nearTargetGroupCheck.sqf";
nul = [_loadout,player] execVM "f\common\fn_folk_assignGear.sqf";

// ====================================================================================
=======
// If the player is already in the group, he simply remains there

_joinDistance = 10;

if (_grp != group player) then {
	[player] joinSilent grpNull;
	[_grp,_joinDistance] execVM "f\JIP\f_JIP_nearTargetGroupCheck.sqf";
};
>>>>>>> .merge_file_a07936


