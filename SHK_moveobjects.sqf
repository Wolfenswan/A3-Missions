/*
  SHK_moveObjects
  Author: Shuko (miika.jarvinen@pp3.inet.fi, shuko@quakenet)
  Version 0.31
  Modified by harakka to use findEmptyPosition for final object position

  Moves set of objects from A to B, retaining the direction and distance from
  a point of reference.

  Parameters:
    0: Object or Position   Anchor, point of origin.
    1: Object or Position   Center position to which objects are moved around.
    2: Number               Range in meters to search for objects.
    3: Array or String      Optional. Type of objects to search for.
    4: Number or Object     Optional. Direction adjustment. Affects position of objects, not the dir they will be facing.
    5: Number or Object     Optional. Direction the objects will be facing after they are moved.

  Examples:
    nul = [gl1,gl2,50] execvm "shk_moveobjects.sqf"
    nul = [start,destination,100,"Man"] execvm "shk_moveobjects.sqf"
    nul = [[3243,5234,0],gl2,50,["Man","Car"]] execvm "shk_moveobjects.sqf"
    nul = [gl1,gl2,50,[],gl2] execvm "shk_moveobjects.sqf"
    nul = [gl1,gl2,50,[],45] execvm "shk_moveobjects.sqf"
    nul = [gl1,gl2,50,[],45,270] execvm "shk_moveobjects.sqf"

*/
private ["_range","_objects","_aPos","_dPos","_xPos","_dir","_dst","_types","_dAdj","_fDir", "_origPos", "_correctedPos"];

_origPos = [];
_correctedPos = [];

_aPos = _this select 0;
_dPos = _this select 1;
_range = _this select 2;
_types = if (count _this > 3) then {_this select 3} else {[]};
_dAdj = if (count _this > 4) then {_this select 4} else {0};
if (count _this > 5) then {
  _fDir = _this select 5;
  if (typename _fDir == typename objNull) then {_fDir = getdir _fDir};
};

if (typename _aPos == typename objNull) then {_aPos = getpos _aPos};
if (typename _dPos == typename objNull) then {_dPos = getpos _dPos};
if (typename _types == typename "") then {_types = [_types]};
if (typename _dAdj == typename objNull) then {_dAdj = getdir _dAdj};

_objects = nearestobjects [_aPos,_types,_range];

{
  _xPos = getpos _x;
  _dir = ((_xPos select 0) - (_aPos select 0)) atan2 ((_xPos select 1) - (_aPos select 1));
  _dir = _dir + _dAdj;
  _dst = _aPos distance _xPos;
  if (!isnil "_fDir") then {_x setdir _fDir};

  _origPos = [((_dPos select 0) + (_dst * sin _dir)), ((_dPos select 1) + (_dst * cos _dir)), 0];

  _pos = [_origPos, 0, 150, 0, 0, 8, 0] call BIS_fnc_findSafePos;
  if (count _pos == 0) then {_pos = [_origPos, 0, 500, 0, 0, 8, 0] call BIS_fnc_findSafePos;};
  _x setPos _pos;
  //_correctedPos = _origPos findEmptyPosition [0, 300, typeOf _x];

 /* if (_x isKindOf "Car") then { _correctedPos = _origPos findEmptyPosition [0, 500, typeOf _x];
  } else {
    _correctedPos = _origPos findEmptyPosition [1, 500, typeOf _x];
  };
  if (count _correctedPos == 0) then {
  diag_log "WARNING: Failed to find empty position for unit, damage may occur.";
  _x setPos _origPos;
  } else {
    _x setPos _correctedPos;
  };
  */
  _x setVectorUp (surfaceNormal (getPosATL _x));
  _x setVelocity [0,0,0];
} foreach _objects;