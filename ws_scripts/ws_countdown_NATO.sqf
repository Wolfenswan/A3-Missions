// Generic countdown script

if !(isServer) exitWith {};

_time = ws_param_time_n * 60;
ws_time_passed_n = 0;
_done = false;

[["ws_alert",["We have begun securing the HEMTT!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
[["ws_alert",["NATO have begun securing the HEMTT!"]],"bis_fnc_showNotification",opfor] spawn BIS_fnc_MP;

while {true} do {

	while {{(side _x == west && _x distance c3 <= 10)} count playableUnits > 0} do {
		sleep 5;
		ws_time_passed_n = ws_time_passed_n + 5;
			if (ws_time_passed_n == _time / 4) then {
				[["ws_alert",["A quarter of the time has passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_time_passed_n == _time / 2) then {
				[["ws_alert",["Half of the time has passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_time_passed_n == (_time / 4)*3) then {
				[["ws_alert",["Three quarters of the time have passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_time_passed_n == (_time - 10)) then {
				[["ws_alert",["10 seconds to rig the cargo!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

		publicVariable "ws_time_passed_n";
		if (ws_time_passed_n >= _time) exitWith {_done = true};
	};

	if (_done && !ws_caches_seized_o) exitWith {
		//Notification
		[["ws_alert",["The HEMTT will explode in 30 seconds! We need to extract!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;

		[["ws_alert",["NATO has rigged the HEMTT!"]],"bis_fnc_showNotification",opfor] spawn BIS_fnc_MP;
		ws_caches_seized_n = true;
		publicVariable "ws_caches_seized_n";


		[
			{
				sleep 30;
				_b = "R_80mm_HE" createVehicle (getPosATL c3); _b setVectorUp(surfaceNormal(getPosATL c3));

				if ({alive _x} count f_var_men_BLU > 0) then {

				deleteVehicle c3;
				ws_allCaches_destroyed = true;
				publicVariable "ws_allCaches_destroyed";
				} else {
					ws_caches_seized_n = false;
					publicVariable "ws_caches_seized_n";
				};
			},
		"BIS_fnc_spawn",false] spawn BIS_fnc_MP;
	};

	[["ws_alert",["We need to stay next to the HEMMT!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
	sleep 5;
};