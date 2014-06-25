[] execVM "ha_spottingMarkers.sqf";

// Display a short text intro
if (!isDedicated) then {
	if (side player == resistance) then {
 	"ws_attack_start" setMarkerAlphaLocal 1;
 };
 if (side player == blufor) then {
 	"ws_defend_start" setMarkerAlphaLocal 1;
 };
sleep 10;
 ["CRATESISTANCE","SOMEWHERE IN ALTIS"] call ws_fnc_showIntro;

};

