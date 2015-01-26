if (isNil "ws_initDone") then {ws_initDone = false};
if (isNil "ws_convoy_ready") then {ws_convoy_ready = false};
if (isNil "ws_convoy_go") then {ws_convoy_go = false};
if (isNil "ws_spotted") then {ws_spotted = false};
if (isNil "ws_obj_cnt ") then {ws_obj_cnt  = 0};


ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

// Disable Thermal Imaging for these vehicles
{_x disableTIEquipment true;} forEach [VehAAF_UGV,VehGrn_MRAP1];

// Further tweaking to vehicles
{_x removeWeaponGlobal "GMG_UGV_40mm";} forEach [VehAAF_UGV];
//{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

if (isNil "UnitAAF_CO_UAV") then {deleteVehicle VehAAF_UGV};
if (isNil "GrpAAF_MRAP1")  then {deleteVehicle VehGrn_MRAP1};
if (isNil "GrpAAF_MRAP2") then {deleteVehicle VehGrn_MRAP2};


ws_initDone = true;