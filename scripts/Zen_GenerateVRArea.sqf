// Generate Random VR Urban Area
// by Zenophon
// Released under Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)
// http://creativecommons.org/licenses/by-nc/4.0/

// Generates an urban style area using VR structures and small objects
// within the given area marker; structure density and small clutter are adjustable
// The angle of the marker will rotate the area, only rectangular areas are created
// The direction and exact position of objects is randomized
// Using a very small grid size (param 2) or marker (param 1) results in objects overlapping
// Usage: Call
// Params: 1. String, an area marker
//         2. Scalar, the grid size in meters, each grid gets one large structure
//         3. Scalar, count of smaller VR objects, each grid gets this many
// Return: Void

private ["_marker", "_squareSize", "_smallClutter", "_spawnPos", "_largeBox", "_smallBox", "_Zen_ArrayGetRandom", "_markerDir"];

_Zen_ArrayGetRandom = {
    (_this select (floor random count _this))
};

_marker = _this select 0;
_squareSize = _this select 1;
_smallClutter = _this select 2;

_markerDir = markerDir _marker;

for "_i" from _squareSize to (((getMarkerSize _marker) select 1)*2 - _squareSize) step _squareSize do {
        _spawnPos = [((getMarkerPos _marker) select 0) + (((getMarkerSize _marker) select 0) * (cos (-180 - _markerDir))), ((getMarkerPos _marker) select 1) + (((getMarkerSize _marker) select 0) * (sin (-180 - _markerDir)))];
        _spawnPos = [(_spawnPos select 0) + (((getMarkerSize _marker) select 1) * (cos (90 - _markerDir))), (_spawnPos select 1) + (((getMarkerSize _marker) select 1) * (sin (90 - _markerDir)))];
        _spawnPos = [(_spawnPos select 0) + (_i * (cos (-90 - _markerDir))), (_spawnPos select 1) + (_i * (sin (-90 - _markerDir)))];

        for "_j" from _squareSize to (((getMarkerSize _marker) select 0)*2 - _squareSize) step _squareSize do {
        _spawnPos = [(_spawnPos select 0) + (_squareSize * (cos -_markerDir)), (_spawnPos select 1) + (_squareSize * (sin -_markerDir))];

        _largeBox = createVehicle [(["Land_VR_Block_01_F", "Land_VR_Block_02_F", "Land_VR_Block_03_F", "Land_VR_Block_04_F", "Land_VR_Block_05_F"] call _Zen_ArrayGetRandom), [(_spawnPos select 0) + random 8 - random 8, (_spawnPos select 1) + random 8 - random 8, 0], [], 0, "NONE"];
        _largeBox setDir (([0, 90, 180, 270] call _Zen_ArrayGetRandom) + _markerDir);

        for "_k" from 1 to _smallClutter do {
            _smallBox = createVehicle [(["Land_VR_CoverObject_01_kneelHigh_F", "Land_VR_CoverObject_01_standHigh_F", "Land_VR_CoverObject_01_kneel_F", "Land_VR_CoverObject_01_kneelLow_F", "Land_VR_CoverObject_01_stand_F"] call _Zen_ArrayGetRandom), [(_spawnPos select 0) + random 12 - random 12, (_spawnPos select 1) + random 12 - random 12], [], 0, "NONE"];
            _smallBox setDir (([0, 90, 180, 270] call _Zen_ArrayGetRandom) + _markerDir);
        };
    };
};

if (true) exitWith {};

// Changelog

// 7/15/14
    // 1. Improved: Area can now turn with marker angle
    // 2. Improved: Object rotation stays at right angles to the marker angle
    // 3. Legal: Added license

// 7/14/14
    // Initial Release
