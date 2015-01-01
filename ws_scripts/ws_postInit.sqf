ws_isHC = [] call ws_fnc_checkHC;

// On neither the server nor the HC
if (!isDedicated && !ws_isHC) then {

	// Display a short text intro
 	[] spawn {
	 waitUntil {time > 15};
		 ["AMMOLOFI BAY","North-West Altis"] call ws_fnc_showIntro;
	};// Display a short text intro
};

if (isNIl "ws_param_hc") then {ws_param_hc = "ws_param_hc" call BIS_fnc_getParamValue;};

// Do stuff on either HC or Server (e.g. spawning)
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && ws_isHC)) then {

	_units = [];
	_garrison = ([] call ws_fnc_collectObjectsNum);
	{
		_units = _units + ((_x getVariable "ws_garrison") call ws_fnc_createGarrison);
		//deleteVehicle _x;
	} forEach _garrison;


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

	// Recalculate F3 variables
	//[0] execVM "f\common\f_setLocalVars.sqf";

	// Stuff to happen AFTER mission launch
	sleep 0.1;

	// If units were spawned set AI skill again
	[] execVM "f\setAISKill\f_setAISkill.sqf";

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
};