if (isNil "ws_meeting_done") then {ws_meeting_done = false};
["ws_o1_dead",false] call ws_fnc_setGVar;
["ws_o2_dead",false] call ws_fnc_setGVar;
["ws_o1_gone",false] call ws_fnc_setGVar;
["ws_o2_gone",false] call ws_fnc_setGVar;

0 setFog [0.4,0.025,40];

if (side player == WEST) then {
	{_x setMarkerAlphaLocal 0} forEach ["mkrVeh","mkrVeh_1"];
	waitUntil {!isNil "ws_meetingM"};
	_mkr = createMarkerLocal ["meeting",getMarkerPos ws_meetingM];
	_mkr setMarkerTypeLocal "mil_triangle";
	_mkr setMarkerColorLocal "colorGreen";
	_mkr setMarkerSizeLocal [0.5,0.5];
	_mkr2 = createMarkerLocal ["meeting2",getMarkerPos ws_meetingM];
	_mkr2 setMarkerShapeLocal "Ellipse";
	_mkr2 setMarkerSizeLocal [12,12];
	_mkr2 setMarkerBrushLocal "Border";
	_mkr2 setMarkerColorLocal "colorGreen";
};

// Display a short text intro
if (!isDedicated) then {
 ["MANHUNT","CENTRAL ALTIS"] spawn {
	 waitUntil {time > 15};
		[
			[
				[_this select 0, "<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",5],
				[_this select 1,"<t align = 'center' shadow = '1' size = '0.8'>%1</t><br/>",5],
				 [format ["%3/%2/%1 %4:%5",date select 0, date select 1, date select 2,date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",10]
			] , 0, 0.7
		] spawn BIS_fnc_typeText;
	};
	sleep 105;
	if (side player == EAST) then {
		while {true} do {
			cutText [format ["%1 minutes since operation start.",round (time/60)],"PLAIN DOWN",2];
			sleep 120;
		};
	};
};


if (isServer) then {
	if (isNil "GrpFIA_Tech1") then {deleteVehicle VehFIA_T1};
	if (isNil "GrpFIA_Tech2") then {deleteVehicle VehFIA_T2};

	_units = ([ws_meetingM,10,west,3 + round random 3] call ws_fnc_createGarrison);
	_units = _units + ([ws_meetingM,80,west,4 + round (({side _x == east}count playableUnits)/3) + round random 5] call ws_fnc_createGarrison);

	_units execVM "f\setAISKill\f_setAISkill.sqf";
	_units execVM "f\assignGear\f_assignGear_AI.sqf";
};