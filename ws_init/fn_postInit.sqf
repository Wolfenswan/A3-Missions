
["ws_var_sideDead",0] call ws_fnc_setGVar;

ws_fnc_HALO = {
	if (side player == east) then {
		f_var_mapClickTeleport_Uses = 1;					// How often the teleport action can be used. 0 = infinite usage.
		f_var_mapClickTeleport_TimeLimit = 0; 			// If higher than 0 the action will be removed after the given time.
		f_var_mapClickTeleport_GroupTeleport = true; 	// False: everyone can teleport. True: Only group leaders can teleport and will move their entire group.
		f_var_mapClickTeleport_Units = [];				// Restrict map click teleport to these units
		f_var_mapClickTeleport_Height = 600;				// If > 0 map click teleport will act as a HALO drop and automatically assign parachutes to units
		[] execVM "f\mapClickTeleport\f_mapClickTeleportAction.sqf";
	};
};

// Display a short text intro
if (!isDedicated) then {
 if (side player == independent) then {
 	"ws_defend_start" setMarkerAlphaLocal 1;
 	"ws_defend_start_area" setMarkerAlphaLocal 1;
 };
sleep 10;
 ["CRATESISTANCE","SOMEWHERE ON TANOA"] call ws_fnc_showIntro;
};