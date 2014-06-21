ws_isHC = [] call ws_fnc_checkHC;

// On neither the server nor the HC
if (!isDedicated && !ws_isHC) then {

	// Display a short text intro
 	[] spawn {
	 waitUntil {time > 15};
		["AFTERNOON DELIGHT","NORTH-WEST OF NEOCHORI"] call ws_fnc_showIntro;
	};
};

if (isNIl "ws_param_hc") then {ws_param_hc = "ws_param_hc" call BIS_fnc_getParamValue;};

// Do stuff on either HC or Server (e.g. spawning)
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && ws_isHC)) then {

	_garrison = [];
	_garrison = ([AAF] call ws_fnc_collectObjects) + ([NATO] call ws_fnc_collectObjects);
	{
		(_x getVariable "ws_garrison_settings") call ws_fnc_createGarrison;
		deleteVehicle _x;
	} forEach _garrison;
};

// Do more stuff exclusively on the server
if (isServer) then {

	sleep 0.1;

	// Recalculate F3 variables
	[0] execVM "f\common\f_setLocalVars.sqf";

	// If units were spawned set AI skill again
	[] execVM "f\setAISKill\f_setAISkill.sqf";
};