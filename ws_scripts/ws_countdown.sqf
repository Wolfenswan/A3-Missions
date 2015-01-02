// Generic countdown script

if !(isServer) exitWith {};

_time = ws_param_time * 60;
ws_time_passed = 0;
_done = false;
_side = blufor;
_side2 = opfor;

_condition ={{(side _x == west && _x distance Trg1 <= 10)} count playableUnits > 0};

[["ws_alert",["We have begun securing the caches!"]],"bis_fnc_showNotification",_side] spawn BIS_fnc_MP;

while {true} do {

	while _condition do {
		sleep 5;
		ws_time_passed = ws_time_passed + 5;
			if (ws_time_passed == _time / 4) then {
				[["ws_alert",["A quarter of the time has passed."]],"bis_fnc_showNotification",_side] spawn BIS_fnc_MP;
			};

			if (ws_time_passed == _time / 2) then {
				[["ws_alert",["Half of the time has passed."]],"bis_fnc_showNotification",_side] spawn BIS_fnc_MP;
			};

			if (ws_time_passed == (_time / 4)*3) then {
				[["ws_alert",["Three quarters of the time have passed."]],"bis_fnc_showNotification",_side] spawn BIS_fnc_MP;
			};

			if (ws_time_passed == (_time - 10)) then {
				[["ws_alert",["10 seconds to secure the caches!"]],"bis_fnc_showNotification",_side] spawn BIS_fnc_MP;
			};

		publicVariable "ws_time_passed";
		if (ws_time_passed >= _time) exitWith {_done = true};
	};

	if (_done exitWith {
		//Notification about successful meeting
		[["ws_alert",["The caches will explode in 30 seconds! We need to extract!"]],"bis_fnc_showNotification",_side] spawn BIS_fnc_MP;

		[["ws_alert",["NATO has rigged the caches!"]],"bis_fnc_showNotification",_side2] spawn BIS_fnc_MP;
		ws_caches_seized_n = true;
		publicVariable "ws_caches_seized_n";
	};

	[["ws_alert",["We need to stay next to the crates!"]],"bis_fnc_showNotification",_side] spawn BIS_fnc_MP;
	sleep 5;
};