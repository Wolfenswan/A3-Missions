
// Display a short text intro
if (!isDedicated) then {
    // Display a short text intro
    [] spawn {
    sleep 0.1;
     waitUntil {time > 10};
        ["SELF SERVICE","CENTRAL ALTIS"] call ws_fnc_showIntro;
    };
};


// Hide the Sector HUD & Markers
deleteMarkerLocal "bis_fnc_modulesector_iconsectormodule1";
deleteMarkerLocal "bis_fnc_modulesector_icontextsectormodule1";
deleteMarkerLocal "bis_fnc_modulesector_iconsectormodule2";
deleteMarkerLocal "bis_fnc_modulesector_icontextsectormodule2";
deleteMarkerLocal "bis_fnc_modulesector_iconsectormodule3";
deleteMarkerLocal "bis_fnc_modulesector_icontextsectormodule3";

[] spawn {
    while {true} do {
        _toHide = [];
        {
            _sector = _x;
            if (player distance _sector > 50) then {
                _toHide set [count _toHide, _sector];
                _h = _sector spawn {
                    waitUntil {player distance _this < 50; sleep 0.1};
                    missionNamespace setVariable ["BIS_fnc_moduleSector_sectors", (missionNamespace getVariable "BIS_fnc_moduleSector_sectors") + [_this]];
                };
            };
        }forEach (missionNamespace getVariable "BIS_fnc_moduleSector_sectors");
        missionNamespace setVariable ["BIS_fnc_moduleSector_sectors", (missionNamespace getVariable "BIS_fnc_moduleSector_sectors") - _toHide];
        sleep 0.1;
    };
};