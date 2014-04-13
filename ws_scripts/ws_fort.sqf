/*
USAGE
[type (integer),object to replace w. fort] execVM "ws_fort.sqf";

DEFAULT TYPES
1: Concrete block w. wooden ramps & bags shielding sides and front.
2: Concrete block w. wooden ramps & bags shielding sides. Lowered Static in center (HMG by default)
3: Concrete block w. wooden ramps & bags shielding sides and front. Raised Static in center (HMG by default)
4: Bunker Tower w. Sandbags shielding exposed top area
5: Bunker Tower w. Sandbags shielding exposed top area. Raised Static on top area (HMG by default)
6: Bunker Tower w. Sandbags shielding exposed top area. Lowered Static on top, facing away from the tower's open side.

NOTE
Orientation follows the original object.
*/

_obj = _this select 1;
_b = objNull;

_thermal = false; //If statics have thermal sights

// Default classes:
_ramp = "Land_Obstacle_Ramp_F";
_corner ="Land_BagFence_Corner_F";
_long = "Land_BagFence_Long_F";
_short = "Land_BagFence_Short_F";
_tower = "Land_BagBunker_Tower_F";
_block = "BlockConcrete_F";

_o = objNull;

switch (_this select 0) do {

// Concrete block w. wooden ramps & bags shielding sides and front.
case 1: {
	_b = _block createVehicle [0,0,0];
	_b setDir 0;

	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,4.6,0.45]];
	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,5.6,-0.1]];
	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,6.6,-0.6]];
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[-3.6,-2,1.6]]; _o setDir 180;
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[3.8,-2,1.6]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[4,0,1.6]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[-4,0,1.6]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[-2,-2.3,1.6]]; _o setDir 180;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[2,-2.3,1.6]]; _o setDir 180;
	_o = (_short) createVehicle [0,0,0]; _o attachTO [_b,[0,-2.3,1.6]]; _o setDir 180;
	};

// Concrete block w. wooden ramps & bags shielding sides. Lowered Static in center (HMG by default)
case 2: {
	_static = "B_HMG_01_F";
	_height = 2.5; //Modify this depending on static used.

	_b = _block createVehicle [0,0,0];
	_b setDir 0;

	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,4.6,0.45]];
	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,5.6,-0.1]];
	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,6.6,-0.6]];
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[-3.6,-2,1.6]]; _o setDir 180;
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[3.8,-2,1.6]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[4,0,1.6]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[-4,0,1.6]]; _o setDir 90;
	_o = (_short) createVehicle [0,0,0]; _o attachTO [_b,[-2.6,-2.2,1.6]]; _o setDir 180;
	_o = (_short) createVehicle [0,0,0]; _o attachTO [_b,[2.8,-2.2,1.6]]; _o setDir 180;
	_o = _static createVehicle [0,0,0]; _o attachTO [_b,[0,-0.2,_height]]; _o setDir 180;
	if !(_thermal) then {_o disableTIEquipment true;};
	};

// Concrete block w. wooden ramps & bags shielding sides and front. Raised Static in center (HMG by default)
case 3: {
	_height = 2.5; //Modify this depending on static used.

	_b = _block createVehicle [0,0,0];
	_b setDir 0;

	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,4.6,0.45]];
	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,5.6,-0.1]];
	(_ramp createVehicle [0,0,0]) attachTO [_b,[2,6.6,-0.6]];
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[-3.6,-2,1.6]]; _o setDir 180;
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[3.8,-2,1.6]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[4,0,1.6]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[-4,0,1.6]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[-2,-2.3,1.6]]; _o setDir 180;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[2,-2.3,1.6]]; _o setDir 180;
	_o = (_short) createVehicle [0,0,0]; _o attachTO [_b,[0,-2.3,1.6]]; _o setDir 180;
	_o = _static createVehicle [0,0,0]; _o attachTO [_b,[0,-1,_height]]; _o setDir 180;
	if !(_thermal) then {_o disableTIEquipment true;};
	};
// Bunker Tower w. Sandbags shielding exposed top area
case 4: {
	_b = _tower createVehicle [0,0,0];
	_b setDir 0;

	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[-1.5,2.6,1]]; _o setDir 270;
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[1.4,2.6,1]];
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[1.8,0.6,1]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[-1.8,0.6,1]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[0,3,1]]; _o setDir 180;

	};

// Bunker Tower w. Sandbags shielding exposed top area. Raised Static on top area (HMG by default)
case 5: {
	_static = "B_HMG_01_high_F";
	_height = 2.2; //Modify this depending on static used.

	_b = _tower createVehicle [0,0,0];
	_b setDir 0;

	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[-1.5,2.6,1]]; _o setDir 270;
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[1.4,2.6,1]];
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[1.8,0.6,1]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[-1.8,0.6,1]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[0,3,1]]; _o setDir 180;

	_o = _static createVehicle [0,0,0]; _o attachTO [_b,[0,1.2,_height]]; _o setDir 0;
	if !(_thermal) then {_o disableTIEquipment true;};
	};

// Bunker Tower w. Sandbags shielding exposed top area. Lowered Static on top, facing away from the tower's open side.
case 6: {
	_static = "B_HMG_01_F";
	_height = 1.8; //Modify this depending on static used.

	_b = _tower createVehicle [0,0,0];
	_b setDir 0;

	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[-1.5,2.6,1]]; _o setDir 270;
	_o = (_corner) createVehicle [0,0,0]; _o attachTO [_b,[1.4,2.6,1]];
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[1.8,0.6,1]]; _o setDir 90;
	_o = (_long) createVehicle [0,0,0]; _o attachTO [_b,[0,3,1]]; _o setDir 180;

	_o = _static createVehicle [0,0,0]; _o attachTO [_b,[0,1.2,_height]]; _o setDir 270;
	if !(_thermal) then {_o disableTIEquipment true;};
	};
};

_pos = (getPosATL _obj);
_b setPosATL _pos;
_b setDir (getDir _obj);
_b setVectorUp (surfaceNormal _pos);
deleteVehicle _obj;