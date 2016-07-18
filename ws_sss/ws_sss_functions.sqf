/* WOLFENSWAN's SIMPLE SPAWN SYSTEM */

// Function to check if a trigger or poi has reached it's group limit
// Returns TRUE if group limit has been reached
_fnc_checkGroupLimit = {
	params["_o"];
	private _groups = _o getVariable ["groupspresent",[]];
	private _maxGroups = _o getVariable ["maxGroups",-1];

	if (_maxGroups != -1 && {_maxGroups <= (count _groups)}) then {
		true
	} else {
		false
	};
};

// Returns a POI which has not yet reached it's group limit
_fnc_getGoodPoi = {
	params ["_trg"];
	private _pois = _trg getVariable ["pois",[]];
	private _poi = _pois call BIS_fnc_selectRandom;
	private _check = true;
	while {_check} do {
		_pois = _pois - [_poi];
		_poi = (_trg getVariable ["pois",[]]) call BIS_fnc_selectRandom;
		_check = ([_poi] call _fnc_checkGroupLimit);
		if (count (_trg getVariable ["pois",[]]) == 0) exitWith {_poi = objNull;};
	};
	_poi
};

// Function to create n groups of a specific type
_fnc_createGroupType = {
	params["_logic","_type","_code"];

	for "_i" from 1 to (_logic getVariable [_type,0]) do {
		systemchat format ["Looping %1 - %2 of %3",_type,_i,(_logic getVariable [_type,0])];
		private _trg = objNull;

		// Keep looping through triggers until a useable one is found
		private _check = true;
		while {_check} do {
			_trg = (_logic getVariable ["triggers",[]]) call BIS_fnc_selectRandom;
			if ([_trg] call _fnc_checkGroupLimit) then {
				systemchat "fail";
				(_logic setVariable ["triggers",_logic getVariable ["triggers",[]] - [_trg]]);
			} else {
				_check = false;
			};
			if (count (_logic getVariable ["triggers",[]]) == 0) exitWith {};
		};
		// If all triggers have reached their max grouzp count, exit with a debug message
		if (count (_logic getVariable ["triggers",[]]) == 0) exitWith {
			["ws_sss DBG: ",[_logic]," is still trying to spawn but all triggers have reached their maximum group count!"] call ws_fnc_debugtext;
		};

		// Find a group that corresponds to the selected type
		private _tempgrps = (_logic getVariable ["groups",[]]);
		private _grp = _tempgrps call Bis_fnc_selectRandom;
		systemchat format ["Selecting from %1",_tempgrps];

		while {!(_grp getVariable [_type,false])} do {
			_tempgrps = _tempgrps - [_grp];

			if (count _tempgrps == 0) exitWith {
				["ws_sss DBG: ",[_logic, _type]," is trying to spawn groups but has no valid groups for the current type available!"] call ws_fnc_debugtext;
			};

			_grp = _tempgrps call Bis_fnc_selectRandom;

			if (_grp getVariable [_type,false]) exitWith {};
		};

		// Create a copy of the picked group at the selected location and call the type-specific code on it
		systemchat format ["Spawning copy of %1",_grp];
		private _classes = [units _grp] call ws_fnc_getObjectClasses;
		private _newgrp = [_grp,_trg,_classes] call _code;
		[_newgrp,behaviour leader _grp,formation leader _grp,combatMode leader _grp,speedMode leader _grp] call ws_fnc_setAIMode;

		// Check if the original group was in a vehicle, if so, add the vehicle
		// TODO Restore mount order of blueprint group rather than blindly mounting new units
		if ({!(vehicle _x isKindOf "Man")} count units _grp > 0) then {
			_veh = (TypeOF (vehicle leader _grp)) createVehicle (getPos leader _newGrp);
			[[_veh],["_newGrp"],true,true] call ws_fnc_loadVehicle;
		};

		_trg getVariable ["groupspresent",[]] pushback (_newgrp);
		_logic getVariable ["groupspresent",[]] pushback (_newgrp);
		//_logic setVariable ["groupspresent",((_logic getVariable ["groupspresent",[]]) + [_newgrp])];

		// If the trigger has reached it's group limit, remove it from the trigger list & select a new one
		if ([_trg] call _fnc_checkGroupLimit) then {
			(_logic setVariable ["triggers",_logic getVariable ["triggers",[]] - [_trg]]);
		};

		// Exit if triggers have been exhausted
		if (count (_logic getVariable ["triggers",[]]) == 0) exitWith {systemchat "out"};
		systemchat format ["Done with loop %2 of %3",_type,_i,(_logic getVariable [_type,0])];
	};
};