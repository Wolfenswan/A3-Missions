// F3 - Folk Unit Markers for Specialists 
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

if (!isDedicated && (player != player)) then
{
    waitUntil {player == player};
    waitUntil {time > 10};
};


// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unt","_mkrType","_mkrText","_mkrColor","_mkrName","_mkr","_untName","_iscop"];

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

if (!alive _unt ) then
	{
	if (true) exitWith {};
	}
	else
	{

// ====================================================================================

// CREATE MARKER
// Depending on the value of _mkrType a different type of marker is created.


				_mkr = createMarkerLocal [_mkrName,[(getPos _unt select 0),(getPos _unt select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "mil_dot";
				_mkrName setMarkerColorLocal "ColorBlack";
				_mkrName setMarkerSizeLocal [0.5, 0.5];
				_mkrName setMarkerTextLocal name _untName;


// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the unit is alive) the marker 
// position is updated periodically. This only happens locally - so as not to burden 
// the server.
	_iscop = false;
	if (!isDedicated) then {
		if (toLower (faction player)== "BLU_F") then {
			_iscop = true;
		};
	};

		for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
		{
			if (alive _unt) then 
			{
			//	if (getMarkerColor _mkrName == "") {
			//		_mkr = createMarkerLocal [_mkrName,[(getPos _unt select 0),(getPos _unt select 1)]];
			//		_mkr setMarkerShapeLocal "ICON";
			//		_mkrName setMarkerTypeLocal "mil_dot";
			//		_mkrName setMarkerColorLocal "ColorBlack";
			//		_mkrName setMarkerSizeLocal [0.5, 0.5];
			//		_mkrName setMarkerTextLocal name _untName;
			//	};
				if (!isNil "Target") then {
					if (_untName == Target) then { // Quary
						_mkrName setMarkerColorLocal "ColorRed";
						_mkrName setMarkerTextLocal format["%1 (Your Quarry)", name _untName];
						_mkrName setMarkerAlphaLocal 1;
					} else {
						if (_untName == player) then { // Me
							_mkrName setMarkerColorLocal "ColorBlue";
							_mkrName setMarkerTextLocal name _untName;
							_mkrName setMarkerTextLocal "You";
						} else { // Player
							if (_iscop) then { // If I am a cop
								_mkrName setMarkerTextLocal name _untName;
								for "_x" from 0 to (count attackerTargetList-1) do {
								   _entry = attackerTargetList select _x; // 0 = attacker, 1 = target.
									if (_untName == _entry select 0) then {
										//Only notify if the Target has changed.
										_mkrName setMarkerTextLocal format ["%1 (their quarrel is %2)", name _untName, name (_entry select 1)];
									};
								};
								
								_mkrName setMarkerColorLocal "ColorRed";
								_mkrName setMarkerAlphaLocal 1;
							} else { 
								_mkrName setMarkerAlphaLocal 0;
							};
						};
					};
				};
				_mkrName setMarkerPosLocal [(getPos _unt select 0),(getPos  _unt select 1)];	
			} else {
				deleteMarker _mkrName;
				if (true) exitWith {};
			};
			sleep 6;
		};

// ====================================================================================

// EXIT FOR DEAD UNITS (PART II)
// If the unit is dead, this script exits.

	};

// ====================================================================================

if (true) exitWith {};

		
