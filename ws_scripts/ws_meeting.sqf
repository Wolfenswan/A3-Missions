if !(isServer) exitWith {};

_time = 120;
_i = 0;

if (!ws_meeting_done) then {
	while {ws_meeting_happening} do {
		sleep 5;
		_i = _i + 5;
			if (_i == _time / 4) then {
				//Notification about quarter time
				[["ws_alert",[]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (_i == _time / 2) then {
				//Notification about half time
				[["ws_alert",[]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (_i == (_time / 4)*3) then {
				//Notification about three-quarter time
				[["ws_alert",[]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (_i == (_time - 1ß) then {
				//Notification about ten seconds left
				[["ws_alert",[]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

		if !(ws_meeting) exitWith {};
		if (_i == _time) exitWith {ws_meeting_done = true};
	};

	if (ws_meeting_done) then {
		//Notification about successful meeting
		[["ws_alert",[]],"bis_fnc_showNotification",true] spawn BIS_fnc_MP;
		publicVariable "ws_meeting_done;"
	};
};