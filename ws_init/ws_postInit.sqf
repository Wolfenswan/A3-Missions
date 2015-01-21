ws_ishc = [] call ws_fnc_checkHC;

/*
// Display a short text intro
if (!isDedicated && !ws_ishc) then {
 ["MORNING SORTIE","CENTRAL ALTIS"] spawn {
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
*/

// Do stuff on either HC or Server (e.g. spawning)
/*
waitUntil {!isNil "ws_param_hc"};
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && ws_ishc)) then {
	// ws_fnc_createGarrison;


	[galati,200,west,8 + round (count playableUnits/5)] spawn ws_fnc_createGarrison;
	[abdera,200,west,6 + round (count playableUnits/4)] spawn ws_fnc_createGarrison;
	[top,100,west,6 + round random 4] spawn ws_fnc_createGarrison;
	[outpost,300,west,8] spawn ws_fnc_createGarrison;
	[outpost_1,100,west,5 + round random 3] spawn ws_fnc_createGarrison;
	[outpost_2,100,west,5 + round random 3] spawn ws_fnc_createGarrison;
	*/

	/*
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

};

// Do more stuff on the server
if (isServer) then {
	// If units were spawned, AI skill is set again
	[] execVM "f\setAISkill\f_setAISkill.sqf";
};
*/