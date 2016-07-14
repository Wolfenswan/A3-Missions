// On players
if (!isDedicated) then {
	if (side player == ws_eola_defenders) then {
		{_x setMarkerAlphaLocal 1} forEach ws_mkr_array;
	};
};


// Do stuff on  Server (e.g. spawning)
if (isServer) then {
	//[] call ws_fnc_createGarrison

	// Recalculate F3 variables
	//[0] execVM "f\common\f_setLocalVars.sqf";

	// If units were spawned set AI skill again
	//[] execVM "f\setAISKill\f_setAISkill.sqf";
};