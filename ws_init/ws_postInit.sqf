ws_ishc = [] call ws_fnc_checkHC;

// Display a short text intro
if (!isDedicated && !ws_ishc) then {
 ["WAKE-UP SERVICE","CENTRAL ALTIS"] spawn {
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
	_units = _units + ((_x getVariable "ws_garrisonSettings") call ws_fnc_createGarrison);
	} forEach _garrisons;

	_units execVM "f\setAISkill\f_setAISkill.sqf";
	_units execVM "f\assignGear\f_assignGear_AI.sqf";

};

// Do more stuff on the server
if (isServer) then {
	["fia_reinf",true] execVM "ws_scripts\ws_cacheStoreRestore.sqf"
};
