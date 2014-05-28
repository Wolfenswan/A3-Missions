[] execVM "ha_spottingMarkers.sqf";

// Display a short text intro
if (!isDedicated) then {
 ["CRATESISTANCE","SOMEWHERE IN ALTIS"] spawn {
	 waitUntil {time > 15};
		[_this select 0,_this select 1] call ws_fnc_showIntro;
	};
};