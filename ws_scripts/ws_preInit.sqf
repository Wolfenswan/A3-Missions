if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

// Disable Thermal Imaging for these vehicles
{_x disableTIEquipment true;} forEach [];

// Further tweaking to vehicles
//{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [];
//{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

// Load up vehicles with groups
// [veh1,group1,group2.....groupN] call ws_fnc_loadVehicle
//[VehAAF_Th1,GrpAAF_ASL,GrpAAF_A1,GrpAAF_A2,GrpAAF_A3] call ws_fnc_loadVehicle;
//[VehAAF_Th2,GrpAAF_BSL,GrpAAF_B1,GrpAAF_B2,GrpAAF_B3] call ws_fnc_loadVehicle;
//[VehAAF_Th3,GrpAAF_CSL,GrpAAF_C1,GrpAAF_C2,GrpAAF_C3] call ws_fnc_loadVehicle;
[VehAAF_Tr1,GrpAAF_BSL,GrpAAF_B1,GrpAAF_B2,GrpAAF_B3] call ws_fnc_loadVehicle;
[VehAAF_Tr2,GrpAAF_CSL,GrpAAF_C1,GrpAAF_C2,GrpAAF_C3] call ws_fnc_loadVehicle;
[VehAAF_Th1,GrpAAF_ASL,GrpAAF_A1] call ws_fnc_loadVehicle;
[VehAAF_Th2,GrpAAF_A2,GrpAAF_MMG1] call ws_fnc_loadVehicle;
[VehAAF_Th3,GrpAAF_A3] call ws_fnc_loadVehicle;
[VehAAF_Th4,GrpAAF_CO,GrpAAF_MTR1] call ws_fnc_loadVehicle;

ws_initDone = true;