_hc = [] call ws_fnc_checkHC;

// Display a short text intro
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


// Do stuff on either HC or Server
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && _hc)) then {

};

// Do more stuff on the server
if (isServer) then {

	// If units were spawned, AI skill is set again
	[] execVM "f\server\f_setAISkill.sqf";
};

// Start the caching
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