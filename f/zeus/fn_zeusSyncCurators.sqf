// F3 Zeus Support - Sync Curators
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private ["_curator","_target","_persistent"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_curator = [_this,0,objNull] call bis_fnc_param;
_targets = [_this,1,allCurators] call bis_fnc_param;
_persistent = [_this,2,true] call bis_fnc_param;

// ====================================================================================

// RESOLVE CURATOR VARIABLE
// If the passed unit is not in the list of all curators, check whether the curator is assigned to it

if !(_curator in allCurators) then {
	_curator = getAssignedCuratorLogic _curator;
};

// If _curator is null or not the correct logic exit with an error message.
if (isNull _curator || typeOf _curator != "ModuleCurator_F") exitWith {
	systemchat format ["F3 DEBUG (f\zeus\fn_zeusSyncCurators.sqf): Could not resolve curator properly, is either null or not the correct logic. IsNull = %1, _curator type: %2",isNull _curator,typeOf _curator];
};

// ====================================================================================

// Make sure curator does not synchronize with himself
if (_curator in _targets) then {_targets = _targets - [_curator]};

// Add existing units from other curator to the targeted curator and set up eventhandlers to add all subsequent units
{
	_curator addCuratorEditableObjects [curatorEditableObjects _x,true];
	_x addCuratorEditableObjects [curatorEditableObjects _curator,true];
} forEach _targets;

if (_persistent) then {
	{
		_curator addEventHandler ['CuratorObjectPlaced',{_x addCuratorEditableObjects [[(_this select 1)],true];}];
		_x addEventhandler ['CuratorObjectPlaced',{_curator addCuratorEditableObjects [[(_this select 1)],true];}];
	} forEach _targets;
};