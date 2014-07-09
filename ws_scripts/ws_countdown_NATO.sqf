// Generic countdown script

if !(isServer) exitWith {};

_time = ws_param_time * 60;
ws_time_passed_n = 0;
_done = false;

[["ws_alert",["We have begun securing the caches!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
[["ws_alert",["NATO have begun seizing the caches!"]],"bis_fnc_showNotification",opfor] spawn BIS_fnc_MP;

while {true} do {

	while {{(side _x == west && _x distance Trg1 <= 10)} count playableUnits > 0} do {
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
				[["ws_alert",["10 seconds to secure the caches!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

		publicVariable "ws_time_passed_n";
		if (ws_time_passed_n >= _time) exitWith {_done = true};
	};

	if (_done && !ws_caches_seized_o) exitWith {
		//Notification about successful meeting
		[["ws_alert",["The caches will explode in 30 seconds! We need to extract!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;

		[["ws_alert",["NATO has rigged the caches!"]],"bis_fnc_showNotification",opfor] spawn BIS_fnc_MP;
		ws_caches_seized_n = true;
		publicVariable "ws_caches_seized_n";


		[
			{
				sleep 30;
				//c1 createVehicle "DemoCharge_Remote_Ammo"

				if ({alive _x} count f_var_men_BLU > 0) then {

				{deleteVehicle _x} forEach [c1,c2,c3,c4,c5];
				ws_allCaches_destroyed = true;
				publicVariable "ws_allCaches_destroyed";
				} else {
					ws_caches_seized_n = false;
					publicVariable "ws_caches_seized_n";
				};
			},
		"BIS_fnc_spawn",false] spawn BIS_fnc_MP;
	};

	[["ws_alert",["We need to stay next to the crates!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
	sleep 5;
};