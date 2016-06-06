ws_isHC = [] call ws_fnc_checkHC;

if (isNIl "ws_param_hc") then {ws_param_hc = "ws_param_hc" call BIS_fnc_getParamValue;};

// Only for players
if (!isDedicated && !ws_isHC) then {

	// Display a short text intro
 	[] spawn {
	 waitUntil {time > 15};
		["OPERATION XYZ","CENTRAL ALTIS"] call ws_fnc_showIntro;
	};
};

// Do stuff on either HC or Server (e.g. spawning)
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && ws_isHC)) then {

	_units = [];
	_garrison = ([] call ws_fnc_collectObjectsNum);
	{
		_units append ((_x getVariable "ws_garrison") call ws_fnc_createGarrison);
		//deleteVehicle _x;
	} forEach _garrison;

	// Set unit AI skill
	_units execVM "f\setAISKill\f_setAISkill.sqf";

	// Equip garrisoned units

	//_units execVM "f\assignGear\f_assignGear_AI.sqf";

	//Light equipment
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

// Do more stuff exclusively on the server (commands with global effect)
if (isServer) then {

	// Common vehicle tweaks
	//{_x disableTIEquipment true;} forEach [];
	//{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [];
	//{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

	// Load up vehicles with groups
	// [veh1,group1,group2.....groupN] call ws_fnc_loadVehicle;

	// NVG-removal, add flashlights
	/*
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
	*/

	// Stuff to happen AFTER mission launch
	sleep 0.1;

	// If units were spawned set AI skill again
	[] execVM "f\setAISKill\f_setAISkill.sqf";
};

ws_postInitDone = true;