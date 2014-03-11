if !(isServer) exitWith {};

_load = {
_vehicle = _this select 0;
_grps = _this select 1;

	{{_x moveInCargo _vehicle;} forEach units _x} forEach _grps;
};

if (paramsarray select 8 == 0) then {
		[VehAAF_TH1, [GrpAAF_CO,GrpAAF_ASL,GrpAAF_A1,GrpAAF_A2,GrpAAF_A3]] call _load;
		[VehAAF_TH2,  [GrpAAF_DC,GrpAAF_BSL,GrpAAF_B1,GrpAAF_B2,GrpAAF_B3]] call _load;
		[VehAAF_TH3,  [GrpAAF_ENG1,GrpAAF_CSL,GrpAAF_C1,GrpAAF_C2,GrpAAF_C3]] call _load;
} else {
	_mkrs = ["mkrN","mkrE","mkrS"];
	_mkr = _mkrs call ws_fnc_selectrandom;
	_vehs = [Veh_Tr1,Veh_Tr2,Veh_Tr3];
	"mkrAAF" setMarkerPos (getMarkerPos format ["%1_1",_mkr]);

	{_string = _mkr + format ["_%1",_forEachIndex];
	_x setPos (getMarkerPos _string);} forEach _vehs;

	[Veh_Tr1, [GrpAAF_CO,GrpAAF_ASL,GrpAAF_A1,GrpAAF_A2,GrpAAF_A3]] call _load;
	[Veh_Tr2,  [GrpAAF_DC,GrpAAF_BSL,GrpAAF_B1,GrpAAF_B2,GrpAAF_B3]] call _load;
	[Veh_Tr3,  [GrpAAF_ENG1,GrpAAF_CSL,GrpAAF_C1,GrpAAF_C2,GrpAAF_C3]] call _load;
};