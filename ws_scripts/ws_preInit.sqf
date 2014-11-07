if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

//{_x animateDoor ["door_back_R",1,true];_x animateDoor ["door_back_L",1,true];_x setCaptive true;clearItemCargoGlobal _x; clearWeaponCargoGlobal _x; clearMagazineCargoGlobal _x;} forEach [VehCSAT_TH1,VehAAF_TH2,VehAAF_TH3,VehAAF_TH4];

// Disable Thermal Imaging for these vehicles
{_x disableTIEquipment true;_x removeWeaponGlobal "missiles_scalpel"} forEach [VehCSAT_AH1];

// Further tweaking to vehicles
//{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [];
//{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

// Load up vehicles with groups
// [veh1,group1,group2.....groupN] call ws_fnc_loadVehicle
// [Veh,Grp] call ws_fnc_loadVehicle;

ws_initDone = true;