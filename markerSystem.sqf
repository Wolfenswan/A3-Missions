// Based on the F3 - Unit Markers (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Prevents the script executing until the player has synchronised correctly:

if (!isDedicated && (player != player)) then
{
    waitUntil {player == player};
    waitUntil {time > 1};
};


private ["_unt","_mkrType","_mkrText","_mkrColor","_mkrName","_mkr","_untName","_canSeeAll"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

call compile format ["
if(!isnil '%1') then
{
	_unt = %1;
};
",_this select 0];

_untName = _this select 0;
_mkrName = format ["mkr_%1",_untName];


// ====================================================================================

// WAIT FOR UNIT TO EXIST IN-MISSION
// We wait for the unit to exist before creating the marker.

if (isNil "_unt") then
{
	call compile format ["
		waitUntil {
		sleep 3;
		!isnil '%1'
		};
		_unt = %1;

	",_untName];
};

// ====================================================================================

// EXIT FOR DEAD UNITS (PART I)
// If the unit does not exist, this script exits.

if (!alive _unt ) then {
	if (true) exitWith {};
};


// ====================================================================================

// CREATE MARKER


_mkr = createMarkerLocal [_mkrName,[(getPos _unt select 0),(getPos _unt select 1)]];
_mkr setMarkerShapeLocal "ICON";
_mkrName setMarkerTypeLocal "mil_dot";
_mkrName setMarkerColorLocal "ColorBlue";
_mkrName setMarkerSizeLocal [0.5, 0.5];
_mkrName setMarkerTextLocal name _untName;

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the unit is alive) the marker
// position is updated periodically. This only happens locally - so as not to burden
// the server.
_canSeeAll = false;

if (toLower (faction player) == "BLU_F") then {
	_canSeeAll = true;
};

if (_unt == player) then {
	_mkrName setMarkerColorLocal "ColorGreen";
	_mkrName setMarkerTextLocal "Me";
} else {
	if (side _unt == west) then {
		_mkrName setMarkerColorLocal "ColorBlue";
	} else {
		_mkrName setMarkerColorLocal "ColorRed";
	};
};

for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
{
	if (!alive _unt) then
	{
		if (side player == west) then {
			_mkrName setMarkerColorLocal "ColorBlack"; // He dead.
			_mkrName setMarkerAlphaLocal 0.5;
		} else {
			deleteMarker _mkrName;
		};
		if (true) exitWith {};
	};
	// Check if dead.
	if (!_canSeeAll) then {
		if (typeof _unt == "seagull") then {
			_canSeeAll = true;
		};
	};
	if (!isNil "Target") then {
		if (_untName == Target) then { // Quary
			_mkrName setMarkerTextLocal format["%1 (Your Quarry)", name _untName];
			_mkrName setMarkerAlphaLocal 1;
		} else {
			if (_untName == player) then { // Me
				//_mkrName setMarkerColorLocal "ColorGreen";
				//_mkrName setMarkerTextLocal name _untName;
				//_mkrName setMarkerTextLocal "You";
			} else { // Player
				if (_canSeeAll) then { // If I am a cop
					_mkrName setMarkerTextLocal name _untName;

					if (side _untName != west) then {
					_mkrName setMarkerTextLocal format ["%1 (their quarrel is %2)", name _untName, name (_untName getVariable["qry_target",objNull])];
					} else {
						_mkrName setMarkerTextLocal format ["%1", name _untName];
					};

					//_mkrName setMarkerColorLocal "ColorRed";
					_mkrName setMarkerAlphaLocal 1;
				} else {
					_mkrName setMarkerAlphaLocal 0;
				};
			};
		};
	};
	_mkrName setMarkerPosLocal [(getPos _unt select 0),(getPos  _unt select 1)];


	sleep 6;
};


// ====================================================================================

if (true) exitWith {};


