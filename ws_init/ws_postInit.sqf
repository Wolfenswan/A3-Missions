_hc = [] call ws_fnc_checkHC;

// Display a short text intro
if (!isDedicated && !_hc) then {
 ["ROOMSERVICE","NORTHERN ALTIS"] spawn {
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

[] execVM "ws_scripts\ws_copcars.sqf";

// Hide the Sector HUD & Markers
deleteMarkerLocal "bis_fnc_modulesector_iconhotelmodule";
deleteMarkerLocal "bis_fnc_modulesector_icontexthotelmodule";

[] spawn {
    while {true} do {
        _toHide = [];
        {
            _sector = _x;
            if (player distance _sector > 45) then {
                _toHide set [count _toHide, _sector];
                _h = _sector spawn {
                    waitUntil {player distance _this < 45};
                    missionNamespace setVariable ["BIS_fnc_moduleSector_sectors", (missionNamespace getVariable "BIS_fnc_moduleSector_sectors") + [_this]];
                };
            };
        }forEach (missionNamespace getVariable "BIS_fnc_moduleSector_sectors");
        missionNamespace setVariable ["BIS_fnc_moduleSector_sectors", (missionNamespace getVariable "BIS_fnc_moduleSector_sectors") - _toHide];
        sleep 0.1;
    };
};