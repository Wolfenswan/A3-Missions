/* WOLFENSWAN's SIMPLE SPAWN SYSTEM */

// Loop through all controller logics and create groups for each type
// TODO set POIs groupspresent + 1 where relevant
{
	private _logic = _x;

	/*
	[_logic,"typename",{
		params ["_grp","_trg","_classes"];
		private _pos = //Code to find position
		private _newgrp = //Code to create group
		// Further code to execute on new group
		_newgrp //Return newly created group
	}] _fnc_createGroupType;
	*/

	// Hold
	[_logic,"hold",{
		params ["_grp","_trg","_classes"];
		private _pos = [_trg] call ws_fnc_getPosInArea;
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;
		[_newgrp,_pos,["HOLD"]] call ws_fnc_addWaypoint;
		_newgrp
	}] call _fnc_createGroupType;

	// Hold (PoI)
	private _type = "hold-poi";
	[_logic,"hold-poi",{
		params ["_grp","_trg","_classes"];
		private _poi = [_trg] call _fnc_getGoodPoi;
		if (isNull _poi) exitWith {
			["ws_sss DBG: ",[_trg, _type]," does not have any valid POIs left but is trying to spawn groups on them!"] call ws_fnc_debugtext;
		};
		private _pos = getPos _poi;
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;
		[_newgrp,_pos,["HOLD",50]] call ws_fnc_addWaypoint;
		_poi getVariable ["groupspresent",[]] pushback (_newgrp);
		_newgrp
	}] call _fnc_createGroupType;

	// Patrol
	[_logic,"patrol",{
		params ["_grp","_trg","_classes"];
		private _pos = [_trg] call ws_fnc_getPosInArea;
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;
		[_newgrp,_pos,["patrol",400]] call ws_fnc_addWaypoint;
		_newgrp
	}] call _fnc_createGroupType;

	// Patrol (PoI)
	[_logic,"patrol-poi",{
		params ["_grp","_trg","_classes"];
		private _poi = [_trg] call _fnc_getGoodPoi;
		if (isNull _poi) exitWith {
			["ws_sss DBG: ",[_trg, _type]," does not have any valid POIs left but is trying to spawn groups on them!"] call ws_fnc_debugtext;
		};
		private _pos = getPos _poi;
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;

		// TODO Randomize patrol points
		{
			[_newgrp,getPos _x,["move"]] call ws_fnc_addWaypoint;
		} forEach(_trg getVariable ["pois",[]]);
		[_newgrp,_pos,["cycle"]] call ws_fnc_addWaypoint;
		_poi getVariable ["groupspresent",[]] pushback (_newgrp);
		_newgrp
	}] call _fnc_createGroupType;

	// Garrison
	[_logic,"garrison",{
		params ["_grp","_trg","_classes"];
		private _pos = nearestBuilding ([_trg] call ws_fnc_getPosInArea);
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;
		[_newgrp,_pos,["garrison",count units _newgrp * 20]] call ws_fnc_addWaypoint;
		_newgrp
	}] call _fnc_createGroupType;

	// Garrison (POI)
	[_logic,"garrison-poi",{
		params ["_grp","_trg","_classes"];
		private _poi = [_trg] call _fnc_getGoodPoi;
		if (isNull _poi) exitWith {
			["ws_sss DBG: ",[_trg, _type]," does not have any valid POIs left but is trying to spawn groups on them!"] call ws_fnc_debugtext;
		};
		private _pos = nearestBuilding _poi;
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;
		[_newgrp,_pos,["garrison",count units _newgrp * 20]] call ws_fnc_addWaypoint;
		_newgrp
	}] call _fnc_createGroupType;

	// Ambush
	[_logic,"ambush",{
		params ["_grp","_trg","_classes"];
		private _pos = [_trg] call ws_fnc_getPosInArea;
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;
		[_newgrp,_pos,["ambush"]] call ws_fnc_addWaypoint;
		_newgrp
	}] call _fnc_createGroupType;

	// Ambush (POI)
	[_logic,"ambush-poi",{
		params ["_grp","_trg","_classes"];
		private _poi = [_trg] call _fnc_getGoodPoi;
		if (isNull _poi) exitWith {
			["ws_sss DBG: ",[_trg, _type]," does not have any valid POIs left but is trying to spawn groups on them!"] call ws_fnc_debugtext;
		};
		private _pos = getPos _poi;
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;
		[_newgrp,_pos,["ambush"]] call ws_fnc_addWaypoint;
		_newgrp
	}] call _fnc_createGroupType;

	// Ambush (Road)
	[_logic,"ambush-road",{
		params ["_grp","_trg","_classes"];
		private _pos = [([_trg] call ws_fnc_getPosInArea)] call ws_fnc_NearestRoadPos;
		private _newgrp = ([_pos,side leader _grp,count units _grp,[_classes,[]]] call ws_fnc_createGroup) select 0;
		[_newgrp,_pos,["ambush"]] call ws_fnc_addWaypoint;
		_newgrp
	}] call _fnc_createGroupType;

} forEach _logics;

// Clean-Up
/*
{
private _grps = _x getVariable ["groups",[]];
	{
		private _grp = _x;
		{deleteVehicle _x} forEach units _grp;
		deleteGroup _grp;
	} forEach _grps;
} forEach _logics;