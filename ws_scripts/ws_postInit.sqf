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
	[AAF,250,independent,10] call ws_fnc_createGarrison;
	[AAF_1,250,independent,10] call ws_fnc_createGarrison;
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
	} forEach [c1,c2,c3,c4,c5,c6,c7,VehCSAT_MH1,VehCSAT_MH2];
};

