// Wolfenswan mission init
// Launched from module init

if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

if (isServer) then {
//if (isNil "GrpCSAT_IFV1" && isNil "GrpCSAT_ENG1") then {deleteVehicle VehCSAT_IFV1};

	{_x disableTIEquipment true;} forEach [VehCSAT_IFV1,VehCSAT_APC1,VehCSAT_APC2,VehCSAT_APC3,VehCSAT_Tr1,VehCSAT_Tr2,VehCSAT_Tr3];
	{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [VehCSAT_APC1,VehCSAT_APC2,VehCSAT_APC3,VehCSAT_Tr1,VehCSAT_Tr2,VehCSAT_Tr3,VehCSAT_Tr4];
	{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [VehCSAT_Tr1,VehCSAT_Tr2,VehCSAT_Tr3,VehCSAT_Tr4];

	[VehCSAT_Car1,GrpCSAT_CO,GrpCSAT_MAT1] call ws_fnc_loadVehicle;

	[VehCSAT_APC1,GrpCSAT_A1,GrpCSAT_ASL] call ws_fnc_loadVehicle;
	[VehCSAT_APC2,GrpCSAT_B1,GrpCSAT_BSL] call ws_fnc_loadVehicle;
	[VehCSAT_APC3,GrpCSAT_C1,GrpCSAT_CSL] call ws_fnc_loadVehicle;

	[VehCSAT_Tr1,GrpCSAT_A2,GrpCSAT_A3] call ws_fnc_loadVehicle;
	[VehCSAT_Tr2,GrpCSAT_B3,GrpCSAT_B2] call ws_fnc_loadVehicle;
	[VehCSAT_Tr3,GrpCSAT_C2,GrpCSAT_C3] call ws_fnc_loadVehicle;
	[VehCSAT_Tr4,GrpCSAT_Eng1,GrpCSAT_MMG1,GrpCSAT_MMG2] call ws_fnc_loadVehicle;
};

ws_initDone = true;