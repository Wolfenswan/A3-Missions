
sleep 0.1;

{_x unassignItem "NVGoggles_INDEP"} forEach f_var_men_RES;

waitUntil {time > 40};

if (ws_param_caching == 1) then {
	[750] call ws_fnc_cInit;

if (serverCommandAvailable "#kick" ) then {
		[5] spawn {

		// Giving the tracker a head start
		sleep (_this select 0 * 1.1);

			while {true} do {
				_str1 = "ws_fnc_cache DBG:<br/>";
				_str2 = format["Total groups: %1<br/>",count allGroups];
				_str3 = format ["Cached groups:%1<br/>",{_x getvariable "ws_cached"} count allGroups];
				_str4 = format ["Activated groups:%1<br/>",{!(_x getvariable "ws_cached")} count allGroups];
				_str5 = format ["Excluded groups:%1<br/>",{(_x getvariable "ws_cacheExcl")} count allGroups];

				hintsilent parseText (_str1+_str2+_str3+_str4+_str5);

				sleep (_this select 0);
			};
		};
	};
};