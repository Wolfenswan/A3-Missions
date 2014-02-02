_hc = [] call ws_fnc_checkHC;

if !(isDedicated && !_hc) then {
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

	{[_x,150,resistance,(5+round random 3)] call ws_fnc_createGarrison;} forEach ["mkrT","mkrT_1","mkrT_2","mkrN","mkrN_1"];

	{[_x,50,resistance,(2+round random 1)] call ws_fnc_createGarrison;} forEach ["mkrS","mkrS_1","mkrS_2","mkrS_3","mkrS_4"];

	["mkrN_2",100,resistance,(4+round random 2)] call ws_fnc_createGarrison;
	["mkrO",20,resistance,5] call ws_fnc_createGarrison;
	["mkrO_1",20,resistance,5] call ws_fnc_createGarrison;
	["mkrH",20,west,2] call ws_fnc_createGarrison;
	["mkrBS",40,west,10] call ws_fnc_createGarrison;
	["mkrH_1",55,west,4] call ws_fnc_createGarrison;
	["mkrH_2",20,west,6] call ws_fnc_createGarrison;
};

if (isServer) then {

	sleep 0.1;
	{_x unassignItem "NVGoggles_INDEP"} forEach allUnits - playableUnits;
};

if (ws_param_caching == 1) then {
	waitUntil {time > 30};
	[850] call ws_fnc_cInit;

	if (isServer) then {
			[60] spawn {

			// Giving the tracker a head start
			sleep 5;

				while {true} do {
					_str1 = "ws_fnc_cache DBG:<br/>";
					_str2 = format["Total groups: %1 | ",count allGroups];
					_str3 = format ["Cached groups:%1 | ",{_x getvariable "ws_cached"} count allGroups];
					_str4 = format ["Activated groups:%1 | ",{!(_x getvariable "ws_cached")} count allGroups];
					_str5 = format ["Excluded groups:%1",{(_x getvariable "ws_cacheExcl")} count allGroups];

					diag_log (_str1+_str2+_str3+_str4+_str5);

					sleep (_this select 0);
				};
			};
		};
};