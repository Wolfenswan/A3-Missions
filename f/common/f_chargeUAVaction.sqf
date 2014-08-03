// F3 - UAV Recharging Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// Do not execute this script anywhere but where the unit is local
if !(local _this) exitWith {};

// If the action has already been added, exit
if (!isNil "f_action_rechargeUAV") exitWith {};

// ====================================================================================

// DECLARE VARIABLES

private ["_code"];

// ====================================================================================

// ADD BATTERIES

_this addMagazines ["Laserbatteries",4];

// ====================================================================================

// ADD BRIEFING ENTRY

player createDiaryRecord ["diary", ["Charging UAV","
<br/>
To charge your UAV land it and select the according action while facing it. This will use up one of your batteries.
"]];

// ====================================================================================

// SETUP CODE
// The following code is executed when the "recharge UAV" action fires

_code = {
	private ["_unit","_move","_uav"];
	_unit = _this select 0;

	// Remove one battery
	_unit removeMagazine 'Laserbatteries';

	// Select an appriopriate animation
	_move = switch (stance _unit) do {
		case "STAND": {"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
		case "CROUCH": {"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"};
		case "PRONE": {"AinvPpneMstpSnonWnonDnon_Putdown_AmovPpneMstpSnonWnonDnon"};
		default {"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
	};

	// Play the animation over the network
	[[[_unit,_move],{(_this select 0) playMove (_this select 1)}],
	"BIS_fnc_spawn",true]spawn BIS_fnc_MP;

	// Cursortarget might have changed, thus using nearestObject is safer
	_uav = (nearestObject [_unit,'UAV_01_base_F']);

	// Make sure the uav is local, if it isn't bounce the setFuel command to all clients and server
	if (local _uav) then {
		_uav setFuel 1;
	} else {
		[[_uav,{if (local _this) then {_this setFuel 1}}],"BIS_fnc_spawn",true] spawn BIS_fnc_MP;
	};

};

// ====================================================================================

// SETUP ACTION
// Add the action to recharge the UAV

f_action_rechargeUAV = _this addAction [
"Recharge UAV",	// Name
 _code,			// Code to execute
 nil,
 1.5,			// Priority
 true,
 true,
 "",
 // Condition for action to show:
 "cursorTarget isKindOf 'UAV_01_base_F' && {{_x == 'Laserbatteries'} count magazines _this > 0 && fuel cursorTarget  < 1 && _this distance cursorTarget < 2 && isTouchingGround cursorTarget}"];