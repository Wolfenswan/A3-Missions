_hc = [] call ws_fnc_checkHC;

// Set global variables
if (isNil "ws_convoy_go") then {ws_convoy_go = false};

// Display a short text intro
if (!isDedicated && !_hc) then {
 [] spawn {
	 waitUntil {time > 15};
		["3-10 to Kavala","To the East of Negades"] call ws_fnc_showIntro;
	};
};


// Do stuff on either HC or Server (e.g. spawning)
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && _hc)) then {

	{
		([_x] + (_x getVariable ["ws_garrison",[]])) call ws_fnc_createGarrison;
	} forEach [AAF,AAF_1,AAF_2,AAF_3,AAF_4,AAF_5,AAF_6,AAF_7];
};


// Do more stuff on the server
if (isServer) then {

 	// Recaculate common variables
	f_script_setLocalVars = [0] execVM "f\common\f_setLocalVars.sqf";

	// If units were spawned, AI skill is set again
	[] execVM "f\setAISkill\f_setAISkill.sqf";

	// Cache the convoy to prevent it from being spotted/coing active
	sleep 0.1;
	{
	 [_x,"f_fnc_gCache",true,false] spawn BIS_fnc_MP;
	 (group _x) setVariable ["f_cacheExcl", true, true];
	 _x allowDamage false;
	} forEach [c1,c2,c3,c4,c5,c6,c7,VehCSAT_MH1,VehCSAT_MH2];
};

