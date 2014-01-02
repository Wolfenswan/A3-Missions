/* WS_populateTownA3
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Requires ws_fnc

FEATURE
Populate buildings in radius around module with number of civilians and cars

USAGE
Min
[object,radius] execVM "ws_populateTown.sqf";
Full
[object,radius,civ inside,civ outside,cars] execVM "ws_populateTownA3.sqf";

RETURNS
Array of civilians created. Center-object gets setVariable "ws_civilians", containg array of all civilians created.

PARAMETERS
1. Object to indicate center of town (gameLogic recommended) | MANDATORY
2. Radius around object to spawn civilian 				 | MANDATORY
3. Number of civilians inside buildings 				| OPTIONAL - default is (# of buildings in the area)
4. Number of civilians on the streets 				| OPTIONAL - default is (# of buildings in the area)/2
5. Number of cars on the streets					| OPTIONAL - default is (# of civilians outside)/2

KNOWN ISSUES
For perfomance reasons all civs are in the same group. They won't all gather at the same place though.
Civilians will have AutoTarget and Target disabled. You need to renable it on a civ if you want them to enage something.
Civilians aren't exactly lively.
Car placement can be somewhat odd.
Some civilians are sunk into building floors.

TODO
Improve car placement
Reliably unstick civs from floor
Add armed guards?
*/
if !(isServer) exitWith {};

_civkillcounter = false;

_civclasses = [];
_carclasses = [];
_validbuildings = [];
if (isNil "ws_game_a3") then {call ws_fnc_gameCheck;};
if (ws_game_a3) then {
	//A3 classes
	_civclasses = ["C_man_1_2_F","C_man_1_3_F","C_man_polo_2_F","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_w_worker_F","C_man_p_shorts_1_F","C_man_shorts_1_F","C_man_shorts_4_F"];
	_carclasses = ["C_Offroad_01_F","C_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Van_01_transport_F","C_Van_01_fuel_F","C_Van_01_box_F","C_Hatchback_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_Offroad_01_F"];
	_validbuildings = ["Fortress", "House","House_Small","Ruins","BagBunker_base_F","Stall_base_F","Shelter_base_F"];
} else {
	//A2 classes
	_civclasses = ["TK_CIV_Takistani_Base_EP1","TK_CIV_Takistani01_EP1","TK_CIV_Takistani02_EP1","TK_CIV_Takistani03_EP1","TK_CIV_Takistani04_EP1","TK_CIV_Takistani05_EP1","TK_CIV_Takistani06_EP1","TK_CIV_Worker01_EP1","TK_CIV_Worker02_EP1","Woman_EP1","TK_CIV_Woman02_EP2","TK_CIV_Woman03_EP1"];
	_carclasses = ["UAZ_Unarmed_TK_CIV_EP1"];
	_validbuildings = ["Fortress", "House","House_Small","Ruins","Church"];
};
_guards = [];

_center = _this select 0;
_radius = _this select 1;

_buildings = [];
_posarray = [];
_bposarray = [];
_civilians = _center getVariable ["ws_civilians",[]];

//Fill buildings array
{
_buildings = _buildings + nearestObjects [(getPos _center),[_x],_radius];
} forEach _validbuildings;

{
    if ((str(_x buildingpos 3) == "[0,0,0]")) then {_buildings = _buildings - [_x]};
} foreach _buildings;

if (count _buildings == 0) exitWith {["ws_populatetown ERROR:",_buildings,"no buildings in radius!"] call ws_fnc_debugText;};

_inside = (count _buildings);
_outside = (count _buildings)/2;
_cars = (_outside/2);
if (count _this >2) then {_inside = _this select 2};
if (count _this > 3) then {_outside = _this select 3};
if (count _this > 4) then {_cars = _this select 4};

//Add building positions to the posarray
while {count _posarray <= _inside} do {
	_building = _buildings call ws_fnc_selectRandom;
	_bposarray = _building getVariable ["ws_bpos",[]];
	if (count _bposarray == 0) then {_bposarray = [_building] call ws_fnc_getBpos;};

	_i = floor (random (count _bposarray));
	_bpos = _bposarray select _i;
	_posarray = _posarray + [_bpos];
	_bposarray set [_i,0];			//Workaround as in http://community.bistudio.com/wiki/Array#Subtraction
	_bposarray = _bposarray - [0];
	_building setVariable ["ws_bpos",_bposarray];
};

if (count _posarray < _inside) then {_inside = count _posarray};

//Add outside positions to the pos array
while {((count _posarray)-_inside) <= _outside} do {
	_pos =  [_center,_radius] call ws_fnc_getPos;
	if !(_pos in _posarray) then {
	_posarray = _posarray + [_pos];
	};
};

//Place vehicles
for "_x" from 1 to _cars do {
	_type = _carclasses call ws_fnc_selectRandom;
	_pos =  [_center,_radius] call ws_fnc_getPos;
	_pos = _pos findEmptyPosition [5,150,_type];
	_veh = _type createVehicle _pos;
	_veh setFuel (0.4 + random 0.4);
	_veh setDir (Random 360);
	_veh setVectorUp(surfaceNormal(getPos _veh));

	if (random 1 > 0.6) then {
		if (ws_game_a3) then {_veh lock 2;} else {_veh lock true;};
	};
};

_grp = createGroup civilian;
{
	_civ = _grp createUnit [(_civclasses call ws_fnc_selectRandom),_x,[],0,"NONE"];
	_civ setBehaviour "AWARE";
	_civ setSpeedMode "NORMAL";
	_center setVariable ["ws_civilians",_civilians +[_civ]];
	_civilians = _center getVariable "ws_civilians";
	doStop _civ;
	_grp enableAttack false;
	_civ disableAI "Autotarget"; _civ disableAI "target";
	_civ setDir (random 360);
	if (getPosATL _civ select 2 != _x select 2) then {_civ setPos [_x select 0,_x select 1,1];_civ setposatl  _x};
} forEach _posarray;


_civilians