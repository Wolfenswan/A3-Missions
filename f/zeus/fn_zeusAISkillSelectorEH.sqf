// // F3 Zeus Support - AI Skill Selector Event Handler
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// ====================================================================================

// DECLARE VARIABLES

private ["_curator"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_curator = [_this,0,objNull] call bis_fnc_param;

// ====================================================================================

// If the eventhandler has already been added, exit
if (_curator getVariable ["f_eh_zeusAISkillSelector",false]) exitWith {};

// ====================================================================================

// Add the eventhandler to set AI skill on newly placed units
_curator addEventHandler ["CuratorObjectPlaced",{
	_unit = [];
	if !((_this select 1) isKindOf "CAManBase") then {
		_unit = crew (_this select 1);
	} else {_unit = [(_this select 1)]};
	[[_unit,'f\setAISKill\f_setAISkill.sqf'],'Bis_fnc_ExecVM',false]call BIS_fnc_MP;
}];

// Set a variable on the module to mark that the event-handler has been added
_curator setVariable ["f_eh_zeusAISkillSelector",true,true];