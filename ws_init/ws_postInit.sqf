[] execVM "ha_spottingMarkers.sqf";

asr_ai3_main_radionet = 0; // Disable ASR AI3 radionet to prevent FIA AI guards to move

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

