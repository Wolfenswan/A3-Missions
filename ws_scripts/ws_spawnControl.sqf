
//Establish if a HC is present
_run = false;
if (isNil "ws_var_useHC") then {ws_var_useHC = paramsarray select 1};
if (ws_var_useHC == 1) then {
    if (call ws_fnc_checkHC) exitWith {_run=true;};
} else {
    if (isServer) exitWith {_run = true;};
};

if !(_run) exitWith {};

_type = toLower ([_this,0,"",["",[]]] call BIS_fnc_Param);
_faction = toLower ([_this,1,"",[""]] call BIS_fnc_Param);
_spawn = [_this,2,[0,0,0],["",objNull,locationNull,[]]] call BIS_fnc_Param;
_radius =  [_this,3,50,[0]] call BIS_fnc_Param;
_groups = [_this,4,1,[0]] call BIS_fnc_Param;

_side = east;
_fiaside = west; //Side of spawned FIA troops
_grpSize = 0;
_sizeCalc = {_int = 2;_int};
_class1 = [];
_class2 = [];
_wptype = "";
_wpmod = 0;
_vehclass = "";
_vehmod = [];
_loaded = false;

if (call ws_fnc_checkHC) then {groups_HC = groups_HC + _groups;publicVariable "groups_HC"};
if (isServer) then {groups_S = groups_S + _groups;publicVariable "groups_S"};


switch (_type) do {
case "patrol": {
	_sizecalc =  {_int=2 + (round random 2);_int};
	_wptype = "patrol";
	_wpmod = 100;

	switch (_faction) do {
	case "blu_f": {};
	case "opf_f": {_side = east;
			_class1 =["O_Soldier_F"];
			_class2 =["O_Soldier_F"];};
	case "ind_f": {};
	case "blu_g_f": {_side = _fiaside;
			_class1 =["B_G_Soldier_F","B_G_Soldier_lite_F"];
			_class2 =["B_G_Soldier_F"];
			};
	case "civ_f": {};
	};
	};
case "sad": {
	_sizecalc =  {_int=3 + (round random 3);_int};
	_wptype = "sad";
	_wpmod = 200;

	switch (_faction) do {
	case "blu_f": {};
	case "opf_f": {_side = east;
			_class1 =["O_soldierU_F","O_soldierU_F","O_soldierU_AAR_F","O_SoldierU_GL_F"];
			_class2 =["O_Soldier_TL_F","O_Soldier_LAT_F","O_Soldier_AR_F"];};
	case "ind_f": {};
	case "blu_g_f": {_side = _fiaside;
			_class1 =["B_G_Soldier_F","B_G_Soldier_lite_F","B_G_Soldier_GL_F","B_G_Soldier_F"];
			_class2 =["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_LAT_F"];
			};
	case "civ_f": {};
	};
	};
case "hold": {
	_sizecalc = {_int=3 + (round random 2);_int};
	_wptype = "hold";
	_wpmod = 50;

	switch (_faction) do {
	case "blu_f": {};
	case "opf_f": {_side = east;
			_class1 =["O_soldierU_F","O_soldierU_F","O_soldierU_AAR_F","O_SoldierU_GL_F"];
			_class2 =["O_Soldier_TL_F","O_Soldier_LAT_F","O_Soldier_AR_F"];};
	case "ind_f": {};
	case "blu_g_f": {_side = _fiaside;
			_class1 =["B_G_Soldier_F","B_G_Soldier_lite_F","B_G_Soldier_GL_F","B_G_Soldier_F","B_G_Soldier_lite_F"];
			_class2 =["B_G_Soldier_TL_F","B_G_Soldier_LAT_F"];
			};
	case "civ_f": {};
	};
	};
case "garrison": {
	_sizecalc =  {_int=3 + (round random 3);_int};
	_wptype = "garrison";
	_wpmod = 100 + _radius;

	switch (_faction) do {
	case "blu_f": {};
	case "opf_f": {_side = east;
			_class1 =["O_soldierU_F","O_soldierU_F","O_soldierU_F","O_SoldierU_GL_F"];
			_class2 =["O_SoldierU_TL_F","O_SoldierU_AR_F"];};
	case "ind_f": {};
	case "blu_g_f": {_side = _fiaside;
			_class1 =["B_G_Soldier_F","B_G_Soldier_lite_F","B_G_Soldier_GL_F","B_G_Soldier_F","B_G_Soldier_lite_F"];
			_class2 =["B_G_Soldier_TL_F"];
			};
	case "civ_f": {};
	};
	};

case "lvehpatrol": {
	_sizecalc = {_int=1;_int};
	_wptype = "patrol";
	_wpmod = 500;
	_vehmod = ["lockDriver"];
	_loaded = true;

	switch (_faction) do {
	case "blu_f": {};
	case "opf_f": {side = east; _class1 =["O_Soldier_F"];_vehclass = "";};
	case "ind_f": {};
	case "blu_g_f": {_side = _fiaside;
			_class1 =["B_G_Soldier_F"];
			_vehclass = "B_G_Offroad_01_armed_F";
			};
	case "civ_f": {};
	};
	};

case "lvehhold": {
	_sizecalc = {_int=2 + round (random 2);_int};
	_wptype = "hold";
	_wpmod = 0;
	_vehmod = ["lockDriver"];
	_loaded = false;

	switch (_faction) do {
	case "blu_f": {};
	case "opf_f": {};
	case "ind_f": {};
	case "blu_g_f": {_side = _fiaside;
			_class1 = ["B_G_Soldier_F"];
			_vehclass = "B_G_Offroad_01_armed_F";
			};
	case "civ_f": {};
	};
	};
default {["ws_spawncontrol ERROR:",_type,"is not accepted!"] call ws_fnc_debugText};
};

//Collect positions
_posarray = [];
while {count _posarray < _groups} do {
_pos = [_spawn,_radius] call ws_fnc_getPos;
_posarray = _posarray + [_pos];
};

_spawned = [];
{
_grpSize = call _sizecalc;
waitUntil {_grpSize != 0;};
_group = grpNull;
	if (count _class2 > 0) then {
		_tmp = [_x,_side,_grpSize,[_class1,_class2]] call ws_fnc_createGroup;
		_group = _tmp select 0;
		_spawned = _spawned + (units _group);
	} else {
		_pos = [_x,200,0,360,true] call ws_fnc_getPos;;
		waitUntil {count _pos == 3};
		_tmp = [_pos,_side,_vehclass,_vehmod,[_grpSize,_class1,_loaded]] call ws_fnc_createVehicle;
		_group = _tmp select 1;
		_spawned = _spawned + (units _group) + (units (_tmp select 2));
	};
[_group,([leader _group,25,15] call ws_fnc_GetPos),[_wptype,_wpmod]] call ws_fnc_addWaypoint;

}forEach _posarray;

sleep 5;
{[_x,f_skillBlu] call f_fnc_setAISkill} forEach _spawned;