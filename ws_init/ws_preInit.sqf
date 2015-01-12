if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

// Disable Thermal Imaging for these vehicles
{_x disableTIEquipment true;} forEach [];
{_x removeWeaponGlobal "GMG_40mm";} forEach [c_1,c_6];

// Further tweaking to vehicles
//{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [];
//{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

// Load up vehicles with groups
// [veh1,group1,group2.....groupN] call ws_fnc_loadVehicle
<<<<<<< HEAD:ws_scripts/ws_preInit.sqf
// [Veh,Grp] call ws_fnc_loadVehicle;
=======
>>>>>>> 51408dc0d8506319f7caabf74f98bc3d543e8aba:ws_init/ws_preInit.sqf

ws_initDone = true;