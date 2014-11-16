if !(isServer) exitWith {};

[0] spawn f_fnc_setTime;

waitUntil {sleep 0.1;scriptDone f_script_setLocalVars};


{
 [_x,"f_fnc_gUnCache",true,false] spawn BIS_fnc_MP;
 _x setVectorUp surfaceNormal (getPosATL _x);
 sleep 0.1;
 _x allowDamage true;
} forEach [c,c_1,c_2,c_3,c_4,c_5,c_6];


{
 [_x,"f_fnc_gUnCache",true,false] spawn BIS_fnc_MP;
 sleep 0.1;
 _x allowDamage true;
} forEach [VehCSAT_MH1,VehCSAT_MH2];

{
   if (side _x == resistance && {!([_x,100] call f_fnc_nearPlayer)}) then {
   		deleteVehicle _x;
	};
} forEach allUnits;

//_cnvmkrs = ["mkrConv"] call ws_fnc_collectMarkers;
[c,"mkrConv"] spawn ws_fnc_taskConvoy;

//[_cnvmkrs,[c1,c2,c3,c4,c5,c6,c7],true] execVM "convoyDefend\convoyDefend_init.sqf";
