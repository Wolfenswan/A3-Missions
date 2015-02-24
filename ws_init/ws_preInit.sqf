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
<<<<<<< HEAD:ws_scripts/ws_preInit.sqf
// [Veh,Grp] call ws_fnc_loadVehicle;
=======
>>>>>>> b86e437f6f2bac3eb53cfe1d4406fb68cd9ed3a6:ws_init/ws_preInit.sqf

ws_initDone = true;