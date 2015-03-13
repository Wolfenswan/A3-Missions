// On players do
if (!isDedicated) then {
	if (side player == ws_eola_defenders) then {
		{_x setMarkerAlphaLocal 1} forEach ws_mkr_array;
	};
};

// Show a short text-intro
waitUntil {time > 10};
["EOLACASTRO","NORTH-WESTERN ALTIS"] call ws_fnc_showIntro;