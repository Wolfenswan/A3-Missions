_hc = [] call ws_fnc_checkHC;

// Display a short text intro
if (!isDedicated && !_hc) then {
 ["SURFIN","WESTERN SHORELINE"] spawn {
	 waitUntil {time > 15};
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
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && _hc)) then {

	_weapons = [
		["hgun_PDW2000_F",8],
		["SMG_01_F",8],
		["SMG_02_ACO_F",8],
		["arifle_Mk20C_F",6],
		["arifle_TRG20_ACO_F",6],
		["arifle_TRG21_F",5],
		["arifle_TRG20_ACO_F",5],
		["arifle_Katiba_C_F",5]
	];

	_units = [FIA,250,west,6 + round (count playableUnits)/3] call ws_fnc_createGarrison;
	_units = _units +  ([FIA_1,180,west,6] call ws_fnc_createGarrison);
	_units = _units +  ([FIA_2,200,west,4 + round (count playableUnits)/4] call ws_fnc_createGarrison);
	_units = _units +  ([FIA_4,150,west,8] call ws_fnc_createGarrison);

	{
		_wp = _weapons call ws_fnc_selectRandom;
		[_x,_wp select 0,_wp select 1] call BIS_fnc_addWeapon;
	} forEach _units;
};

// Do more stuff on the server
if (isServer) then {
	// If units were spawned, AI skill is set again
	[] execVM "f\server\f_setAISkill.sqf";
};