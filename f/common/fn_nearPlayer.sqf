// F3 - Near Player Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_ent","_distance","_pos"];
_pos = getPosATL (_this select 0);
_distance = _this select 1;

// ====================================================================================

// Check whether a player is in the given distance - return true if yes
if (({isPlayer _x && _x distance _pos < _distance} count playableUnits) > 0) exitWith {true};
false
