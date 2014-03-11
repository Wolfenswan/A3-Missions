if !(isServer) exitWith {};

_insertion = paramsarray select 8;

if (_insertion == 0) then {
{{_x moveInCargo VehAAF_Th1} forEach units _x} forEach [GrpAAF_CO,GrpAAF_ASL,GrpAAF_A1,GrpAAF_A2,GrpAAF_A3];
{{_x moveInCargo VehAAF_Th2} forEach units _x} forEach [GrpAAF_BSL,GrpAAF_B1,GrpAAF_B2,GrpAAF_B3,GrpAAF_MTR1];
{{_x moveInCargo VehAAF_Th3} forEach units _x} forEach [GrpAAF_CSL,GrpAAF_C1,GrpAAF_C2,GrpAAF_C3,GrpAAF_MMG1];
{deleteVehicle _x} forEach [VehAAF_Tr1,VehAAF_Tr2,VehAAF_Tr3];
};

if (_insertion == 1) then {
{{_x moveInCargo VehAAF_Tr1} forEach units _x} forEach [GrpAAF_CO,GrpAAF_ASL,GrpAAF_A1,GrpAAF_A2,GrpAAF_A3];
{{_x moveInCargo VehAAF_Tr2} forEach units _x} forEach [GrpAAF_BSL,GrpAAF_B1,GrpAAF_B2,GrpAAF_B3,GrpAAF_MTR1];
{{_x moveInCargo VehAAF_Tr3} forEach units _x} forEach [GrpAAF_CSL,GrpAAF_C1,GrpAAF_C2,GrpAAF_C3,GrpAAF_MMG1];
{deleteVehicle _x} forEach [VehAAF_Th1,VehAAF_Th2,VehAAF_Th3];
};

if (isNil "GrpAAF_MRAP1") then {deleteVehicle VehGrn_MRAP1};
if (isNil "GrpAAF_MRAP2") then {deleteVehicle VehGrn_MRAP2};
if (isNil "GrpAAF_IFV1") then {deleteVehicle VehGrn_IFV1};
if (isNil "GrpAAF_ENG1") then {deleteVehicle VehGrn_CAR1};