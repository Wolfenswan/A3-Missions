if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

// Disable Thermal Imaging for these vehicles
{_x disableTIEquipment true;} forEach [];

// Further tweaking to vehicles
{_x animateDoor ["door_back_R",1,true];_x animateDoor ["door_back_L",1,true];_x setCaptive true;} forEach [VehAAF_H1,VehAAF_H2,VehAAF_H3,VehAAF_H4];
//{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [];
//{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

// Load up vehicles with groups
// [veh1,group1,group2.....groupN] call ws_fnc_loadVehicle
[VehAAF_H1,GrpAAF_ASL,GrpAAF_A1,GrpAAF_A2,GrpAAF_A3] call ws_fnc_loadVehicle;
[VehAAF_H2,GrpAAF_BSL,GrpAAF_B1,GrpAAF_B2,GrpAAF_B3] call ws_fnc_loadVehicle;
[VehAAF_H3,GrpAAF_CSL,GrpAAF_C1,GrpAAF_C2,GrpAAF_C3] call ws_fnc_loadVehicle;
[VehAAF_H4,GrpAAF_CO,GrpAAF_MMG1,GrpAAF_MAT1] call ws_fnc_loadVehicle;

ws_initDone = true;