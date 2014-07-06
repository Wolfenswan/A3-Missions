// Generic countdown script

if !(isServer) exitWith {};

_time = ws_param_time * 60;
ws_time_passed = 0;
_done = false;

[["ws_alert",["We have begun securing the caches!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
[["ws_alert",["NATO have begun seizing the caches!"]],"bis_fnc_showNotification",opfor] spawn BIS_fnc_MP;

while {true} do {

	while {{(side _x == west && _x distance Trg1 <= 10)} count playableUnits > 0} do {
		sleep 5;
		ws_time_passed = ws_time_passed + 5;
			if (ws_time_passed == _time / 4) then {
				[["ws_alert",["A quarter of the time has passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_time_passed == _time / 2) then {
				[["ws_alert",["Half of the time has passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_time_passed == (_time / 4)*3) then {
				[["ws_alert",["Three quarters of the time have passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_time_passed == (_time - 10)) then {
				[["ws_alert",["10 seconds to secure the caches!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

		publicVariable "ws_time_passed";
		if (ws_time_passed >= _time) exitWith {_done = true};
	};

	if (_done) exitWith {
		//Notification about successful meeting
		[["ws_alert",["We have secured the intel!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
		[["ws_alert",["NATO has secured the caches!"]],"bis_fnc_showNotification",opfor] spawn BIS_fnc_MP;
		ws_caches_seized = true;
		publicVariable "ws_caches_seized;"
	};

	[["ws_alert",["We need to stay next to the crates!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
	sleep 5;
};