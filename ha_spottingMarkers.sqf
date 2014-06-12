// Spotter markers script by harakka, with lots of help from Head, and some more help from Wolfenswan.
// The original version of this script was inspired by the Awarness Script v1.00 by afp, December 2009.

f_ha_createMarkers = {

	{
		_mkrText = _x select 0;
		_mkrPos = _x select 1;

		_mkr = createMarkerLocal [format["ha_spotting_%1", _forEachIndex], _mkrPos];;
		_mkr setMarkerShapeLocal "ICON";
		_mkr setMarkerTypeLocal "hd_destroy";
		_mkr setMarkerTextLocal _mkrText;

		// Make the marker fade out
		[_mkr] spawn {
			for "_x" from 0 to 45 do {
				(_this select 0) setMarkerAlphaLocal (1 - _x/45);
				sleep 0.5;
				if (markerAlpha (_this select 0) == 0) exitWith {deleteMarkerLocal (_this select 0)};
			};
		};

	} forEach _this;
};

if(!isServer) exitWith{};

sleep 5;
_spotterSide = west;		// This side will report and receive sightings
_spotters = [];
// Generate a list of units that do the spotting
{
    if (side _x == _spotterSide && !(isPlayer leader _x)) then {
        _spotters = _spotters + units _x;
    };
} forEach allGroups;

_spottingMarkers = [];
_markerCount = 6;
_markerReuseIndex = 0;
_waitBetweenChecks = 20;

while {true} do {
	_spottedThisRound = [];
		// check if _spotter has any enemies seen.
		// if yes, check they haven't been spotted already.
		// then send the non-spotted ones over as markers.
	{
		_spotter = _x;
		_spotted = [];



		if (alive _spotter) then {
		_spotted = _spotter call BIS_fnc_enemyTargets;
		{
			if (_x distance (_spotted select 0) < 100) then {_spotted = _spotted - [_x]};
		} forEach (_spotted - [_spotted select 0]);

		{
			if !(_x in _spottedThisRound) then {
				_spottedThisRound set [count _spottedThisRound,_x];
			};
		} forEach _spotted
		};

	} forEach _spotters;

	// Reduce spotted array in size


	// Grab the spotted units' positions with jitter added and send them over
	{
		_pos = position _x;
		// The random pos code lifted from Kylania & Big Dawg KS (http://forums.bistudio.com/showthread.php?t=122517)
		_ang = random 360;
		_dis = random 30;
		_dx = sin(_ang)*_dis;
		_dy = cos(_ang)*_dis;
		_posWithJitter = [(_pos select 0) + _dx, (_pos select 1) + _dy, 0];

		//_spottingMarkers set [_markerReuseIndex, [format ["%1:%2", date select 3, date select 4], _posWithJitter]];
		_spottingMarkers set [_markerReuseIndex, [format ["%1:%2", date select 3, date select 4], _posWithJitter]];
		_markerReuseIndex = _markerReuseIndex + 1;
		if (_markerReuseIndex > _markerCount) then {_markerReuseIndex = 0;};

	} forEach _spottedThisRound;

	if (count _spottingMarkers > 0) then {
		[_spottingMarkers,"f_ha_createMarkers", _spotterSide] call bis_fnc_mp;
	};

	sleep _waitBetweenChecks;
};