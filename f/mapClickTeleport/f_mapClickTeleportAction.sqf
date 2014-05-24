// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_textAction"];

// ====================================================================================

// CHECK IF COMPONENT SHOULD BE ENABLED
<<<<<<< .merge_file_a03696
// We end the script if it is not running on a player's machine, or if debug mode is
// not enabled, or if the global variable f_missionMakerTeleport has not been set to 
// the value 1 in init.sqf.

if (!local player || f_var_debugMode == 0 && f_missionMakerTeleport == 0 || f_var_debugMode == 0 && f_missionMakerTeleport == 1) exitWith {};
=======
// We end the script if it is not running on a server or if only group leaders can use
// the action and the player is not the leader of his/her group

if (isDedicated) exitWith {};
if (count f_var_mapClickTeleport_Units > 0 && !(player in f_var_mapClickTeleport_Units)) exitWith {};
if (f_var_mapClickTeleport_GroupTeleport && player != leader group player)  exitWith {};
>>>>>>> .merge_file_a09328

// ====================================================================================

// SET KEY VARIABLES

_textAction = localize "STR_f_mapClickTeleportAction";

// ====================================================================================

// ADD TELEPORT ACTION TO PLAYER ACTION MENU
// Whilst the player is alive we add the teleport action to the player's action menu.
// If the player dies we wait until he is alive again and re-add the action.

<<<<<<< .merge_file_a03696
while {true} do
{
	F3_mapClickTeleportAction = player addaction [_textAction,"f\common\f_mapClickTeleport.sqf","", 0, false, true];
	waitUntil {!alive player};
	waitUntil {alive player};
	sleep 0.01;
};
	
=======
f_mapClickTeleportAction = player addaction [_textAction,{[] spawn f_fnc_mapClickTeleportUnit},"", 0, false,true,"","_this == player"];

if (f_var_mapClickTeleport_TimeLimit > 0) then {
	sleep f_var_mapClickTeleport_TimeLimit;
	player removeAction f_mapClickTeleportAction;
};
>>>>>>> .merge_file_a09328
