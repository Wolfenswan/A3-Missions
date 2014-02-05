if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

if (!isNil "GrpAAF_R") then {
	_mkr = (["mkrR"] call ws_fnc_collectMarkers) call ws_fnc_selectRandom;
	{
		_x setPos  ([_mkr,5,1] call ws_fnc_getPos);
		_x setDir ([_x,town] call BIS_fnc_dirTo);
		_x setUnitPos "middle";
	} forEach units GrpAAF_R;
};

_mkrs = ["mkrM"] call ws_fnc_collectMarkers;
ws_meetingM = _mkrs call ws_fnc_selectRandom;
{_x setPos (getMarkerPos ws_meetingM)} forEach [TrgM,TrgM_1,TrgM_2];
publicVariable "ws_meetingM";

car1 setDir ([car1,town] call BIS_fnc_dirTo);
car1 setVectorUp(surfaceNormal(getPos car1 ));
VehFIA_Tech1 setPos ([car1,50,15,0,true] call ws_fnc_getPos);
VehFIA_Tech1 setDir ([VehFIA_Tech1,town] call BIS_fnc_dirTo);
VehFIA_Tech1 setVectorUp(surfaceNormal(getPos VehFIA_Tech1));

car2 setDir ([car2,town] call BIS_fnc_dirTo);
car2 setVectorUp(surfaceNormal(getPos car2));
VehFIA_Tech2 setPos ([car2,50,15,0,true] call ws_fnc_getPos);
VehFIA_Tech2 setDir ([VehFIA_Tech2,town] call BIS_fnc_dirTo);
VehFIA_Tech2 setVectorUp(surfaceNormal(getPos VehFIA_Tech2));

if (ws_param_civs == 1) then {
	[town,250,20,20] execVM "ws_scripts\ws_populateTown.sqf";
};


if (ws_param_uav == 0) then {
	VehAAF_UAV removeMagazineTurret ["6Rnd_LG_scalpel",[-1]];
};


ws_initDone = true;