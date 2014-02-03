if (isNil "ws_caches_destroyed") then {ws_caches_destroyed = false;};
if (isNIl "GrpNATO_Int") then {GrpNATO_Int = grpNull};
if (faction player != "BLU_F" || (group player == GrpNATO_Int)) then{"fia_conv" setMarkerAlphaLocal 1;};
if (faction player == "BLU_G_F" || (group player == GrpNATO_Int)) then {{_x setMarkerAlphaLocal 1;};}forEach ["a1","a2","a3","a4"];

if (ws_var_jitter != 9999) then {if (faction player == "BLU_F" && !(group player == GrpNATO_Int)) then{"us_conv" setMarkerAlphaLocal 1;"us_conv1" setMarkerAlphaLocal 1;};};



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

	// If units were spawned, AI skill is set again
	[] execVM "f\server\f_setAISkill.sqf";
};

// Start the caching
if (ws_param_caching != 0) then {
	waitUntil {time > 30};
	[ws_param_caching] call ws_fnc_cInit;
};
*/