// F3 - Authorised Crew Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

<<<<<<< .merge_file_a07552
// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_fromEH","_vehicle","_vehicleRole","_unitToCheck","_restrictedCrew","_warningMsg"];
=======
// DECLARE VARIABLES AND FUNCTIONS

private ["_fromEH","_vehicle","_vehicleRole","_unitToCheck","_restrictedCrew","_warningMsg","_restrictcargo"];
>>>>>>> .merge_file_a07352

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

_fromEH = _this select 0;
<<<<<<< .merge_file_a07552
_vehicle = _fromEH select 0;
_vehicleRole = _fromEH select 1;
_unitToCheck = _fromEH select 2;
_restrictedCrew = _this select 1;
=======
_restrictedList= _this select 1;
_restrictcargo = if (count _this > 2) then {_this select 2} else {false};

_vehicle = _fromEH select 0;
_vehicleRole = _fromEH select 1;
_unitToCheck = _fromEH select 2;

>>>>>>> .merge_file_a07352
_warningMsg = localize "STR_f_UnauthorisedCrew_Warning";

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrew.sqf): _fromEH = %1",_fromEH];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrew.sqf): _vehicle = %1",_vehicle];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrew.sqf): _vehicleRole = %1",_vehicleRole];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrew.sqf): _unitToCheck = %1",_unitToCheck];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrew.sqf): _restrictedCrew = %1",_restrictedCrew];
	player sideChat format ["DEBUG (f\common\f_isAuthorisedCrew.sqf): _warningMsg = %1",_warningMsg];
};

// ====================================================================================

<<<<<<< .merge_file_a07552
// PERFORM CHECKS
// We do not need to perform all of this script on all clients simulaneously, so if
// the unit triggering the the event handler is local to another client, we exit the
// script. Unless the unit is entering as cargo, or part of the authorised crew, it
// is ejected from the vehicle with a warning message (as a hint).

if ((local _unitToCheck) && (_vehicleRole != "CARGO") && (!(_unitToCheck in _restrictedCrew))) then
{
	hint format ["%1",_warningMsg];
	_unitToCheck action ["getout",_vehicle];
};

// ====================================================================================

if (true) exitWith {};
=======
// PERFORM CHECKS I
// We do not need to perform all of this script on all clients simulaneously, so if
// the unit triggering the the event handler is local to another client or entering the vehicle in a cargo slot, we exit the
// script.

if !(local _unitToCheck) exitWith {};
if (_vehicleRole == "CARGO" && !_restrictcargo) exitWith {};

// ====================================================================================

// INTERPRET RESTRICTED ARRAY
// Loop through the array containing the allowed classes and units and split them into two

_restrictedTypes = [];
_restrictedUnits = [];
{
  if (typeName _x == typeName "") then {_restrictedTypes set [count _restrictedListTypes,_x]};
  if (typeName _x == typeName objNull) then {_restrictedUnits set [count _restrictedListTypes,_x]};
} forEach _restrictedList;

// ====================================================================================

// PERFORM CHECKS II
// Check if the unit is one of the allowed units or in the allowed types, if not, eject it from the vehicle.

if (_unitToCheck in _restrictedUnits || ({_unitToCheck isKindOf _x} count _restrictedTypes == 1)) exitWith {};

["UnauthorisedCrew",[_warningMsg]] call BIS_fnc_showNotification;
_unitToCheck action ["getout",_vehicle];
>>>>>>> .merge_file_a07352
