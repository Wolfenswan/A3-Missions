_hc = [] call ws_fnc_checkHC;

// Display a short text intro
if (!isDedicated && !_hc) then {
 [] spawn {
	 waitUntil {time > 10};
		["3-10 to Kavala","To the East of Negades"] call ws_fnc_showIntro;
	};
};


// Do stuff on either HC or Server (e.g. spawning)
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && _hc)) then {

	_garrison = [AAF] call ws_fnc_collectObjectsNum;
	_units = [];
	{
		_units = _units + ((_x getVariable "ws_garrison") call ws_fnc_createGarrison);
		//deleteVehicle _x;
	} forEach _garrison;


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
	asr_ai3_sysdanger_radiorange = 0; // To make sure the AAF isn't too competent
};

// Do more stuff on the server
if (isServer) then {

	// Set global variables
	["ws_convoy_go",false,true] call ws_fnc_setGVar;
	["ws_convoy_dead",false,true] call ws_fnc_setGVar;
	["ws_killzone_secure",false,true] call ws_fnc_setGVar;


	// Recalculate F3 variables
	// [] execVM "f\common\f_setLocalVars.sqf";

	// Stuff to happen AFTER mission launch
	// sleep 0.1;
	// If units were spawned set AI skill again
	//


	// Cache the convoy to prevent it from being spotted/coing active
	sleep 0.1;
	{
	 [_x,"f_fnc_gCache",true,false] spawn BIS_fnc_MP;
	 (group _x) setVariable ["f_cacheExcl", true, true];
	 _x allowDamage false;
	} forEach [c,c_1,c_2,c_3,c_4,c_5,c_6,VehCSAT_MH1,VehCSAT_MH2];

	// Stuff to happen AFTER mission launch


	// NVG-removal, add flashlights

	{
   private ["_unit"];
      _unit = _x;

      // Only run where the unit is local, it isn't a player and doesn't have a flashlight
      if (local _unit && side _unit == resistance && !isplayer _unit && !("acc_flashlight" in primaryWeaponItems _unit)) then {

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

};



