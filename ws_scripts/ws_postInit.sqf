// On neither the server nor the HC
if (!isDedicated) then {
	if (side player == ws_eola_defenders) then {
		{_x setMarkerAlphaLocal 1} forEach ws_mkr_array;
	};
};


// Do stuff on either HC or Server (e.g. spawning)
if (isServer) then {
	//[] call ws_fnc_createGarrison
};

// Do more stuff exclusively on the server
if (isServer) then {

	// Recalculate F3 variables
	//[0] execVM "f\common\f_setLocalVars.sqf";

	// If units were spawned set AI skill again
	//[] execVM "f\setAISKill\f_setAISkill.sqf";
};