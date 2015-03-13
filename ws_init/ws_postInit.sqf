ws_ishc = [] call ws_fnc_checkHC;

// Display a short text intro
if (!isDedicated && !ws_ishc) then {
 ["WAKE-UP SERVICE","NORTH-WESTERN ALTIS"] spawn {
	 waitUntil {time > 25};
		[
			[
				[_this select 0, "<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",5],
				[_this select 1,"<t align = 'center' shadow = '1' size = '0.8'>%1</t><br/>",5],
				 [format ["%3/%2/%1 %4:%5",date select 0, date select 1, date select 2,date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",10]
			] , 0, 0.7
		] spawn BIS_fnc_typeText;
	};
};


// Do stuff on either HC or Server (e.g. spawning)

waitUntil {!isNil "ws_param_hc"};
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && ws_ishc)) then {

	_garrisons = [FIA] call ws_fnc_collectObjectsNum;
	_units = [];
	{
		_units append ((_x getVariable "ws_garrison") call ws_fnc_createGarrison);
	} forEach _garrisons;

};

// Do more stuff on the server
if (isServer) then {
	["fia_reinf",true] execVM "ws_scripts\ws_cacheStoreRestore.sqf";

	//[] execVM "f\assignGear\f_assignGear_AI.sqf";

	// Wait until in the mission so HC etc. can do their thing
	sleep 0.1;
	_gear = [
		["hgun_PDW2000_F",8],
		["SMG_01_F",8],
		["SMG_02_ACO_F",8],
		["arifle_Mk20C_F",8],
		["arifle_Katiba_C_F",8],
		["arifle_TRG20_F",8]
	];

	{
		if (side _x == west && {local _x && typeOf _x in ["B_G_Soldier_lite_F","B_G_Soldier_LAT_F","B_G_Soldier_F"]}) then {
			_wp = _gear call ws_fnc_selectRandom;
			[_x,_wp select 0,_wp select 1] call BIS_fnc_addWeapon;
		};
	} forEach allUnits;


	// If units were spawned set AI skill again
	// [] execVM "f\setAISKill\f_setAISkill.sqf";

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
