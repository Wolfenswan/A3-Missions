// F3 - Add group join option to action menu
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// This script can be called either without parameters, or with a single boolean parameter.
// The boolean indicates whether players are allowed to join groups on different side.

// Only run this for players
if (isDedicated) exitWith{};

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

private ["_nearUnit", "_nearGroup", "_actionDistance", "_actionGraceTime", "_allowDifferentSide"];

// How many meters player needs to be from another group's leader for the join action to be shown
_actionDistance = 2.5;
// How many seconds the action is shown for when you leave group leader's range
_actionGraceTime = 3;

// Check if script caller wants to enable joining of groups on different sides, default to false
_allowDifferentSide = [_this,0,false] call bis_fnc_param;

// If nearest unit is leader of a different group with playable units in it, add option to join that group
while {true} do {
	if (isPlayer cursorTarget && {cursorTarget isKindOf "CAManBase"}) then {
		_nearUnit = cursorTarget;
		_nearGroup = group cursorTarget;

		// Using curly braces makes the if statement cheaper to evaluate, but requires OA 1.62
		if (group player != _nearGroup && {alive _nearUnit && _nearUnit == leader _nearGroup}) then {
			if (_allowDifferentSide || side player == side _nearGroup) then {
				_actionString = format["Join: %1", name _nearUnit];

				f_groupJoinAction = player addAction [_actionString, {
					[player] joinSilent (_this select 3);
					["JIP",[format ["You have joined %1.",name leader (_this select 3)]]] call BIS_fnc_showNotification;
					_unit = player;
					{
						if (isPlayer _x) then {
							[["JIP",[format ["%1 has joined your group.",name _unit]]],"BIS_fnc_showNotification",_x] spawn BIS_fnc_MP;
						};
					} forEach (units (_this select 3) - [_unit]);

					if (isNil "f_groupLeaveAction") then {
						f_groupLeaveAction = player addAction ["Leave group", {
							[player] joinSilent grpNull;
							["JIP",["You have left the group."]] call BIS_fnc_showNotification;
							player removeAction f_groupLeaveAction
						}];
					};
					player removeAction f_groupJoinAction;
				}, _nearGroup, 0, false, true, "", "_this == player"];

				// Once player leaves the group leader's vicinity, remove action
				waitUntil {sleep 0.1;player distance _nearUnit > _actionDistance};
				sleep _actionGraceTime;
				if !(isNil "f_groupJoinAction") then {
					player removeAction f_groupJoinAction;
				};
			};
		};
	};
	sleep 1;
};