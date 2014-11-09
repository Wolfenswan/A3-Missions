// On neither the server nor the HC
if (!isDedicated) then {

	// Display a short text intro
 	[] spawn {
 	sleep 0.1;
 	setViewdistance 2500;
 	[player, 0.1, 1, false] call BIS_fnc_sandstorm;
	 waitUntil {time > 10};
		["SALT RIDERS","The salt flats"] call ws_fnc_showIntro;
	};
};