if (isNil "ws_caches_destroyed") then {ws_caches_destroyed = false;};

if (isNil "ws_var_jitter") then {ws_var_jitter = "ws_var_jitter" call BIS_fnc_getParamValue;};
if (isNil "ws_var_friendly") then {diag_log "setting ws_var_friendly";ws_var_friendly = "ws_var_friendly" call BIS_fnc_getParamValue;};

if (faction player == "BLU_F") then{
	if (ws_var_jitter != 9999) then {
		if (ws_var_jitter == 0) then {
			"fia_conv" setMarkerAlphaLocal 1;
		} else {
			"us_conv" setMarkerAlphaLocal 1;"us_conv1" setMarkerAlphaLocal 1;
		};
	};
} else {
	"fia_conv" setMarkerAlphaLocal 1;
};

if (ws_var_friendly == 1) then {
	west setfriend [resistance,1];
	resistance setfriend [west,1];
};

if (faction player == "ind_g_f") then {{_x setMarkerAlphaLocal 1;};}forEach ["a1","a2","a3","a4"];

// Display a short text intro
if (!isDedicated) then {
 ["A FRIEND IN NEED","WESTERN ALTIS"] spawn {
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

/*
// Do stuff on either HC or Server (e.g. spawning)
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && _hc)) then {

};



// Do more stuff on the server
if (isServer) then {
	_gear = [
		["hgun_PDW2000_F",8],
		["SMG_01_F",8],
		["SMG_02_ACO_F",8],
		["arifle_Mk20C_F",6],
		["arifle_TRG20_ACO_F",6],
		["arifle_TRG21_F",5],
		["arifle_Katiba_C_F",5]
	];

	{
		if (side _x == independent && !isPlayer _x) then {
			_wp = _gear call ws_fnc_selectRandom;
			[_x,_wp select 0,_wp select 1] call BIS_fnc_addWeapon;
		};
	} forEach allUnits;
};


// Start the caching
if (ws_param_caching != 0) then {
	waitUntil {time > 30};
	[ws_param_caching] call ws_fnc_cInit;
};
*/