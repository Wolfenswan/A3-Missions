if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

// Disable Thermal Imaging for these vehicles
{_x disableTIEquipment true;} forEach [VehNATO_UGV,VehNATO_UGV_1];

// Further tweaking to vehicles
{_x removeWeaponGlobal "GMG_UGV_40mm";} forEach [VehNATO_UGV,VehNATO_UGV_1];
//{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

// Load up vehicles with groups
// [veh1,group1,group2.....groupN] call ws_fnc_loadVehicle

ws_initDone = true;