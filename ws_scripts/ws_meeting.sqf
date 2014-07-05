if !(isServer) exitWith {};

_time = 600;
ws_meeting_passed = 0;

[["ws_alert",["Our meeting has begun!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;

while {alive UnitFIA_CO && alive UnitFIA_DC} do {

	while {(UnitFIA_CO distance TrgM <= 15) && (UnitFIA_DC distance TrgM <= 15)} do {
		sleep 5;
		ws_meeting_passed = ws_meeting_passed + 5;
			if (ws_meeting_passed == _time / 4) then {
				[["ws_alert",["A quarter of the meeting time has passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_meeting_passed == _time / 2) then {
				[["ws_alert",["Half of the meeting time has passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_meeting_passed == (_time / 4)*3) then {
				[["ws_alert",["Three quarters of the meeting time have passed."]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

			if (ws_meeting_passed == (_time - 10)) then {
				[["ws_alert",["10 seconds to finish the meeting!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
			};

		publicVariable "ws_meeting_passed";
		if (ws_meeting_passed >= _time) exitWith {ws_meeting_done = true};
	};

	if (ws_meeting_done) exitWith {
		//Notification about successful meeting
		[["ws_alert",["The meeting is over!"]],"bis_fnc_showNotification",true] spawn BIS_fnc_MP;
		publicVariable "ws_meeting_done;"
	};

	[["ws_alert",["The officers need to stay in the meeting area!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
	sleep 5;
};

if ({!alive _x} count [UnitFIA_DC,UnitFIA_CO] > 0) exitWith {
		[["ws_alert",["An officer was killed. Let's bail!"]],"bis_fnc_showNotification",blufor] spawn BIS_fnc_MP;
};
