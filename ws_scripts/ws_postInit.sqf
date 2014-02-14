// Display a short text intro
if (!isDedicated) then {

 // First string is mission name, second location of AO
 ["X-EOLA","SOMEWHERE IN ALTIS"] spawn {
	 waitUntil {time > 15};
		[_this select 0, _this select 1] call ws_fnc_showIntro
	};
};

// WS - x-eola setup
// Display markers for defending team

if (side player == ws_eola_defenders && !isDedicated) then {
	[] spawn {
		waitUntil {count ws_mkr_array > 0};
		{
		    _x setMarkerAlphaLocal 1;
		} forEach ws_mkr_array;
	};
};