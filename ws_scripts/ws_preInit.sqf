// Wolfenswan mission init
// Launched from module init

if (isNil "ws_initDone") then {ws_initDone = false};
if (ws_initDone) exitWith {};

if (isServer) then {
// Setting up mission
	{_x disableTIEquipment true;} forEach [VehCSAT_IFV1,VehCSAT_APC1,VehCSAT_APC2,VehCSAT_APC3,VehCSAT_Tr1,VehCSAT_Tr2,VehCSAT_Tr3];
	{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [VehCSAT_APC1,VehCSAT_APC2,VehCSAT_APC3,VehCSAT_Tr1,VehCSAT_Tr2,VehCSAT_Tr3,VehCSAT_Tr4];
	{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [VehCSAT_Tr1,VehCSAT_Tr2,VehCSAT_Tr3,VehCSAT_Tr4];

	{
		[_x,150,resistance,(5+round random 3)] call ws_fnc_createGarrison;
	} forEach ["mkrT","mkrT_1","mkrT_2","mkrN","mkrN_1"];

	{
		[_x,50,resistance,(2+round random 1)] call ws_fnc_createGarrison;
	} forEach ["mkrS","mkrS_1","mkrS_2","mkrS_3","mkrS_4"];

	["mkrN_2",100,resistance,(4+round random 2)] call ws_fnc_createGarrison;
	["mkrO",20,resistance,5] call ws_fnc_createGarrison;["mkrO_1",20,resistance,5] call ws_fnc_createGarrison;

	["mkrH",15,resistance,2] call ws_fnc_createGarrison;["mkrH_1",55,resistance,4] call ws_fnc_createGarrison;["mkrH_2",20,resistance,6] call ws_fnc_createGarrison;

//if (isNil "GrpCSAT_IFV1" && isNil "GrpCSAT_ENG1") then {deleteVehicle VehCSAT_IFV1};

	[VehCSAT_Car1,GrpCSAT_CO,GrpCSAT_MAT1] call ws_fnc_loadVehicle;

	[VehCSAT_APC1,GrpCSAT_A1,GrpCSAT_ASL] call ws_fnc_loadVehicle;
	[VehCSAT_APC2,GrpCSAT_B1,GrpCSAT_BSL] call ws_fnc_loadVehicle;
	[VehCSAT_APC3,GrpCSAT_C1,GrpCSAT_CSL] call ws_fnc_loadVehicle;

	[VehCSAT_Tr1,GrpCSAT_A2,GrpCSAT_A3] call ws_fnc_loadVehicle;
	[VehCSAT_Tr2,GrpCSAT_B3,GrpCSAT_B2] call ws_fnc_loadVehicle;
	[VehCSAT_Tr3,GrpCSAT_C2,GrpCSAT_C3] call ws_fnc_loadVehicle;
	[VehCSAT_Tr4,GrpCSAT_Eng1,GrpCSAT_MMG1,GrpCSAT_MMG2] call ws_fnc_loadVehicle;

	ws_initDone = true; publicVariable "ws_initDone";
};