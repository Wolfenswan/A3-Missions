_hc = [] call ws_fnc_checkHC;

if (!isDedicated && !_hc) then {
 waitUntil {time > 15};
	[
		[
			["OPERATION AFTERNOON DELIGHT", "<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",5],
			["CENTRAL ALTIS","<t align = 'center' shadow = '1' size = '0.8'>%1</t><br/>",5],
			 [format ["%3/%2/%1 %4:%5",date select 0, date select 1, date select 2,date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",10]
		] , 0, 0.7
	] spawn BIS_fnc_typeText;
};

if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && _hc)) then {

	{[_x,150,resistance,(6+round random 4)] call ws_fnc_createGarrison;} forEach ["mkrT","mkrT_1","mkrT_2","mkrN","mkrN_1"];

	{[_x,50,resistance,(3+round random 2)] call ws_fnc_createGarrison;} forEach ["mkrS","mkrS_1","mkrS_2","mkrS_3","mkrS_4","mkrS_5"];

	["mkrN_2",100,resistance,(6+round random 2)] call ws_fnc_createGarrison;
	["mkrO",20,resistance,6] call ws_fnc_createGarrison;
	["mkrO_1",20,resistance,6] call ws_fnc_createGarrison;
	["mkrH",20,west,5] call ws_fnc_createGarrison;
	["mkrBS",40,west,12] call ws_fnc_createGarrison;
	["mkrH_1",55,west,6] call ws_fnc_createGarrison;
	["mkrH_2",20,west,10] call ws_fnc_createGarrison;
};

if (isServer) then {

	sleep 0.1;
	{_x unassignItem "NVGoggles_INDEP"} forEach allUnits - playableUnits;
	[] execVM "f\server\f_setAISkill.sqf";
};