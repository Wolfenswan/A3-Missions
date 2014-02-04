if (isServer) then {
	_mkrs = ["mkrM"] call ws_fnc_collectMarkers;
	ws_meetingM = _mkrs call ws_fnc_selectRandom;
	{_x setPos (getMarkerPos ws_meetingM)} forEach [TrgM,TrgM_1];
	publicVariable "ws_meetingM";
};

if (side player == BLUFOR) then {
	waitUntil {!isNil "ws_meetingM"};
	_mkr = createMarkerLocal ["meeting",getMarkerPos ws_meetingM];
	_mkr setMarkerTypeLocal "mil_triangle";
	_mkr setMarkerColorLocal "colorGreen";
	_mkr setMarkerSizeLocal [0.5,0.5];
	_mkr2 = createMarkerLocal ["meeting2",getMarkerPos ws_meetingM];
	_mkr2 setMarkerShapeLocal "Ellipse";
	_mkr2 setMarkerSizeLocal [10,10];
	_mkr2 setMarkerBrushLocal "Border";
	_mkr2 setMarkerColorLocal "colorGreen";
};

// Display a short text intro
if (!isDedicated) then {
 ["OPERATION XYZ","CENTRAL ALTIS"] spawn {
	 waitUntil {time > 15};
		[
			[
				[_this select 0, "<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",5],
				[_this select 1,"<t align = 'center' shadow = '1' size = '0.8'>%1</t><br/>",5],
				 [format ["%3/%2/%1 %4:%5",date select 0, date select 1, date select 2,date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",10]
			] , 0, 0.7
		] spawn BIS_fnc_typeText;
	};
};