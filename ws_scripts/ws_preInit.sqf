// Wolfenswan mission init
// Launched from module init

if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

if (isServer) then {
//if (isNil "GrpCSAT_IFV1" && isNil "GrpCSAT_ENG1") then {deleteVehicle VehCSAT_IFV1};
	{_x disableTIEquipment true;} forEach [VehCSAT_Tr1,VehCSAT_Tr2,VehCSAT_Tr3,VehCSAT_Tr4];
	{_x removeWeaponGlobal "GMG_40mm";} forEach [VehCSAT_Tr1,VehCSAT_Tr2,VehCSAT_Tr3,VehCSAT_Tr4];
};

ws_initDone = true;