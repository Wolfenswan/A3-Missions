ws_isHC = [] call ws_fnc_checkHC;
ws_var_garrisonWest = ["B_G_Soldier_lite_F","B_G_Soldier_F"];

// On neither the server nor the HC
if (!isDedicated && !ws_isHC) then {
	player addEventHandler ["WeaponAssembled",{(_this select 1) disableTIEquipment true}];

	// Display a short text intro
 	[] spawn {
	 waitUntil {time > 10};
		["HILLSIDE VIEW","NORTH-WESTERN ALTIS"] call ws_fnc_showIntro;
	};
};

if (isNIl "ws_param_hc") then {ws_param_hc = "ws_param_hc" call BIS_fnc_getParamValue;};
if (isNil "ws_campsecured") then {ws_campsecured = 0};

{
	_x addAction ["Destroy crates",{
	(_this select 0) setDamage 1;
	[[[],{ws_campsecured = ws_campsecured + 1; publicVariable "ws_campsecured";}],'BIS_fnc_Spawn',false] call BIS_fnc_MP;
	[[[(_this select 0),(_this select 2)],{(_this select 0) removeAction (_this select 1);["alert",["FIA storage destroyed"]] call BIS_fnc_showNotification;}],'BIS_fnc_Spawn',true] call BIS_fnc_MP;
	},[],1.5,true,true,"","_target distance _this < 10"];
} forEach [box,box_1,box_2,box_3,box_4,box_5];



// Do stuff on either HC or Server (e.g. spawning)
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && ws_isHC)) then {

	_units = [];
	_garrison = ([FIA] call ws_fnc_collectObjectsNum);
	{
		_units = [_units,((_x getVariable "ws_garrison") call ws_fnc_createGarrison)] call BIS_fnc_arrayPushStack;
		//deleteVehicle _x;
	} forEach _garrison;

	// If units were spawned set AI skill again
	_units spawn {
		sleep 0.1;
		[[_this,'f\setAISKill\f_setAISkill.sqf'],'BIS_fnc_execVM',false] spawn BIS_fnc_MP;
	};
	_units execVM "f\setAISKill\f_setAISkill.sqf";

	// Equip garrisoned units

	//_units execVM "f\assignGear\f_assignGear_AI.sqf";

	/*
	_gear = [
		["hgun_PDW2000_F",5],
		["SMG_01_F",6],
		["SMG_02_ACO_F",4],
		["arifle_Mk20C_F",5],
		["arifle_Katiba_C_F",5],
		["arifle_TRG20_F",5]
	];

	{
		_wp = _gear call ws_fnc_selectRandom;
	[_x,_wp select 0,_wp select 1] call BIS_fnc_addWeapon;
	} forEach _units;
	*/
};

// Do more stuff exclusively on the server
if (isServer) then {

	if ({isNil _x} count ["GrpCSAT_BSL","GrpCSAT_B1","GrpCSAT_B2","GrpCSAT_B3"] == 4) then {
		deleteVehicle VehCSAT_TH2;
	};

	if (isNil "GrpCSAT_AH1") then {
		deleteVehicle VehCSAT_AHS1;
	};

	_gear = [
		["hgun_PDW2000_F",6],
		["SMG_01_F",6],
		["SMG_02_ACO_F",6],
		["arifle_Mk20C_F",6],
		["arifle_Katiba_C_F",6],
		["arifle_TRG20_F",6]
	];

	{
		if (side _x == west && {local _x && typeOf _x in ["B_G_Soldier_lite_F","B_G_Soldier_F"]}) then {
		_wp = _gear call ws_fnc_selectRandom;
		[_x,_wp select 0,_wp select 1] call BIS_fnc_addWeapon;
	};
	} forEach allUnits;
	// Recalculate F3 variables
	// [] execVM "f\common\f_setLocalVars.sqf";

	// Stuff to happen AFTER mission launch
	// sleep 0.1;

	// If units were spawned set AI skill again
	//

	// NVG-removal, add flashlights

	{
   private ["_unit"];
      _unit = _x;

      // Only run where the unit is local, it isn't a player and doesn't have a flashlight
      if (local _unit && !isplayer _unit && !("acc_flashlight" in primaryWeaponItems _unit)) then {

      // Remove laser if equipped
      if ("acc_pointer_IR" in primaryWeaponItems _unit) then {_x removePrimaryWeaponItem "acc_pointer_IR"};
      _unit addPrimaryWeaponItem "acc_flashlight";   // Add flashlight

      // Removes NVGs from unit
      	 {
            if (_x in assigneditems _unit) exitWith {_unit unlinkItem _x};
         } forEach ["NVGoggles_OPFOR","NVGoggles_INDEP","NVGoggles"];
      };

		      // Forces flashlights on
		       // _unit enablegunlights "forceOn";
	} forEach allUnits;


	//8000 setFog [0.3,0.025,210];

    // Forces flashlights on
    // _unit enablegunlights "forceOn";
};