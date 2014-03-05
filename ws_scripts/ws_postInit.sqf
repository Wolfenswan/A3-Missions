if (isNil "ws_meeting") then {ws_meeting = false};

if (side player == BLUFOR) then {
	{_x setMarkerAlphaLocal 0} forEach ["mkrVeh","mkrVeh_1"];
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
};

if (isServer) then {

	if (ws_param_civs == 1) then {
		[town,200,5,10] execVM "ws_scripts\ws_populateTown.sqf";
		[town_1,200,5,10] execVM "ws_scripts\ws_populateTown.sqf";
	};


	if (ws_param_uav == 0) then {
		VehAAF_UAV removeMagazineTurret ["6Rnd_LG_scalpel",[-1]];
	};

};

if !(isNil "UnitAAF_CO_UAV") then {
UnitAAF_CO_UAV connectTerminalToUav VehAAF_UAV;
};
