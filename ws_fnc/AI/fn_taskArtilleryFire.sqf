/* ws_fnc_taskArtilleryFire
Latest: 21.12.2013
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Allows saturation of a target or target area by artillery piece(s).

USAGE
Minimal:
[artillery,target] call ws_fnc_taskArtilleryFire
Full:
[artillery,target,[shots per barrage,number of barrages],max dispersion from target,,ammo to use] call ws_fnc_taskArtilleryFire

PARAMETERS
1. The artillery piece or array of artillery pieces to fire 														| MANDATORY - object or array
2. The target to fire on to. Can be icon marker, object, array of icon markers/objects,  area marker or trigger.	| MANDATORY - object or string (markername)
If it's	an area marker or trigger the shots will randomly land somewhere inside the marker/trigger area. If it's
an array of icon markers/objects, the targets will be randomly selected from the array.
3. The firemission as an array. The first number dictates the shots per barrage, the second the						| OPTIONAL - array with [number,number] (default: [4,1])
total number of barrages
4. The max. dispersion from target.																					| OPTIONAL - number (default: 80)
5. Time to sleep between each barrage, if set to -1 it will sleep until the splash of the							| OPTIONAL - number > 0 or -1 (default: -1)
current barrage's last shot
6. The ammo to be used, if "" it will use the primary ammo (HE most of the time)									| OPTIONAL - string refering to ammo class or "" (default: "")

EXAMPLES
TODO

RETURNS
true
*/

if !(ws_game_a3) exitWith {["ws_fnc_taskArtilleryFire DBG:",[]," Must be ARMA 3!"] call ws_fnc_debugtext};

private ["_art","_dispersion","_fireMission","_ammo"];

_art = [_this,0,objNull] call BIS_fnc_param;
_target = [_this,1,[0,0,0]] call BIS_fnc_param;
_fireMission = ([_this,2,[4,1]]) call BIS_fnc_param;
_dispersion = [_this,3,80] call BIS_fnc_param;
_sleep = ([_this,4,-1]) call BIS_fnc_param;
_ammo = [_this,5,""] call BIS_fnc_param;

if (isNull _art || str _target == "[0,0,0]" || count (getArtilleryAmmo [_art]) == 0) exitWith {
	["ws_fnc_taskArtilleryFire DBG: Illegal artillery unit or target! _art | _target :",[_art,_target],""] call ws_fnc_debugtext
};


switch (typeName _art) do {
	case "OBJECT": {_art = [_art]};
	case "ARRAY": {};
};

{
	// Spawn a seperate fire mission for each artillery piece
	[_x,_target,_dispersion,_fireMission,_sleep,_ammo] spawn {
		private ["_target","_dispersion","_fireMission","_ammo","_sleep","_artpiece"];

		_artpiece = _this select 0;
		_target = _this select 1;
		_dispersion = _this select 2;
		_fireMission = _this select 3;
		_sleep = _this select 4;
		_ammo = _this select 5;

		// Start looping through the barrages
		for "_x" from 1 to (_fireMission select 1) do {
			_targetPos = [];

			if (!(canFire _artPiece) || !(alive _artPiece))  exitWith {};

			for "_x" from 1 to (_fireMission select 0) do {

				if (!(canFire _artPiece) || !(alive _artPiece))  exitWith {};

				switch (typeName _target) do {

						case (typeName objNull): {
							if (count (triggerArea _target) != 0) then {
								_targetpos = [_target] call ws_fnc_getPosInArea;
							} else {
								_targetpos = _target call ws_fnc_getEPos;
							};
						};

						case (typeName ""): {
							if (markerShape _target == "ICON") then {
								_targetpos = _target call ws_fnc_getEPos;
							} else {
								_targetpos = [_target] call ws_fnc_getPosInArea;
							};
						};

						case (typeName []): {
							_targetPos = (_target call ws_fnc_selectRandom) call ws_fnc_getEPos;
						};
				};

				// Resolve the target position with the dispersion setting
				if (_dispersion > 0) then {
					_targetpos = [_targetpos,_dispersion] call ws_fnc_getPos;
				};

				// Select the ammo
				if (_ammo == "") then {
					_ammo = currentMagazine _artpiece;
				};

				// Fire a shot, then re-select a target
				_artpiece doArtilleryFire [_targetpos,_ammo,1];

				sleep 1;
				waitUntil {(unitReady gunner _artpiece || !(canFire _artPiece) || !(alive _artPiece))};
			};

			// Sleep until the new barrage should begin
			if (_sleep < 0 ) then {
				// Wait for the last shot to hit the target before shifting to the next barrage
				sleep (_artpiece getArtilleryETA [_targetpos,_ammo]);
			} else {
				sleep _sleep;
			};
		};
	};

} forEach _art;

true