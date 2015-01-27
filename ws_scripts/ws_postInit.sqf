// On neither the server nor the HC
if (!isDedicated) then {
	setViewdistance 2500;

	// Display a short text intro
 	[] spawn {
	 waitUntil {time > 10};
		["SALT RIDERS","The salt flats"] call ws_fnc_showIntro;
	};
};