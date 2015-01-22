if (isNil "ws_allCaches_destroyed") then {ws_allCaches_destroyed = false;};
if (isNil "ws_caches_seized_n") then {ws_caches_seized_n = false;};
if (isNil "ws_caches_seized_o") then {ws_caches_seized_o = false;};
//if (isNil "ws_param_jitter") then {ws_param_jitter = "ws_param_jitter" call BIS_fnc_getParamValue;};
//if (isNil "ws_param_friendly") then {ws_param_friendly = "ws_param_friendly" call BIS_fnc_getParamValue;};

if (faction player == "BLU_F") then{
	/*
	if (ws_param_jitter != 9999) then {

		if (ws_param_jitter == 0) then {
			"fia_conv" setMarkerAlphaLocal 1;
		} else {
			"us_conv" setMarkerAlphaLocal 1;
			"us_conv1" setMarkerAlphaLocal 1;
		};
	};
	*/
	"us_conv" setMarkerAlphaLocal 1;
	"us_conv1" setMarkerAlphaLocal 1;
} else {
	"fia_conv" setMarkerAlphaLocal 1;
	"mkrCSATBorder" setMarkerAlphaLocal 1;
};


if (ws_param_friendly == 1) then {
	west setfriend [resistance,1];
	resistance setfriend [west,1];
};


if (faction player == "ind_g_f") then {{_x setMarkerAlphaLocal 1;};}forEach ["a1","a2","a3","a4"];

// Display a short text intro
if (!isDedicated) then {
 [c3,"oil","large"] execVM "ws_scripts\smokecolumn.sqf";
 [c7,"oil","small"] execVM "ws_scripts\smokecolumn.sqf";
 ["Delivery Denied","ALTIS"] spawn {
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