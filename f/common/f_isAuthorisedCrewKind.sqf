// F2 - Authorised Crew Kind Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_fromEH","_vehicle","_vehicleRole","_unitToCheck","_restrictedCrewType","_warningMsg"];

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

_fromEH = _this select 0;
_vehicle = _fromEH select 0;
_vehicleRole = _fromEH select 1;
_unitToCheck = _fromEH select 2;
_restrictedCrewType = _this select 1;
_warningMsg = localize "STR_f_UnauthorisedCrew_Warning";

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrewType.sqf): _fromEH = %1",_fromEH];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrewType.sqf): _vehicle = %1",_vehicle];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrewType.sqf): _vehicleRole = %1",_vehicleRole];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrewType.sqf): _unitToCheck = %1",_unitToCheck];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrewType.sqf): _typeToCheck = %1",_typeToCheck];
  player sideChat format ["DEBUG (f\common\f_isAuthorisedCrewType.sqf): _strTypeToCheck = %1",_strTypeToCheck];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrewType.sqf): _restrictedCrewType = %1",_restrictedCrewType];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrewType.sqf): _warningMsg = %1",_warningMsg];
};

// ====================================================================================

// PERFORM CHECKS
// We do not need to perform all of this script on all clients simulaneously, so if
// the unit triggering the the event handler is local to another client, we exit the
// script. Unless the unit is entering as cargo, or part of the authorised crew, it
// is ejected from the vehicle with a warning message (as a hint).

if ((local _unitToCheck) && (_vehicleRole != "CARGO") && (!(_unitToCheck isKindOf _restrictedCrewType))) then
{
	hint format ["%1",_warningMsg];
	_unitToCheck action ["getout",_vehicle];
};

// ====================================================================================

if (true) exitWith {};
