if !(isDedicated) then {
 waitUntil {time > 15};
	[
		[
			["OPERATION AFTERNOON DELIGHT", "<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",5],
			["CENTRAL ALTIS","<t align = 'center' shadow = '1' size = '0.8'>%1</t><br/>",5],
			 [format ["%3/%2/%1 %4:%5",date select 0, date select 1, date select 2,date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",10]
		] , 0, 0.7
	] spawn BIS_fnc_typeText;
};

if (isServer) then {

	sleep 0.1;
	{_x unassignItem "NVGoggles_INDEP"} forEach f_var_men_RES;

	if (ws_param_caching == 1) then {
		waitUntil {time > 40};
		[750] call ws_fnc_cInit;
	};
};