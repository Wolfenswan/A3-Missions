if !(isServer) exitWith {};

[0] spawn f_fnc_setTime;

waitUntil {sleep 0.1;scriptDone f_script_setLocalVars};

{
 [_x,"f_fnc_gUnCache",true,false] spawn BIS_fnc_MP;
 _x setVectorUp surfaceNormal (getPosATL _x);
 sleep 0.1;
 _x allowDamage true;
} forEach [c1,c2,c3,c4,c5,c6,c7];

{
 [_x,"f_fnc_gUnCache",true,false] spawn BIS_fnc_MP;
 sleep 0.1;
 _x allowDamage true;
} forEach [VehCSAT_MH1,VehCSAT_MH2];

f_script_setLocalVars = [0] execVM "f\common\f_setLocalVars.sqf";

{
   deleteVehicle _x;
} forEach f_var_men_res;

private ["_cnvmkrs"];
_cnvmkrs = ["mkrConv"] call ws_fnc_collectMarkers;
[_cnvmkrs,[c1,c2,c3,c4,c5,c6,c7],true] execVM "convoyDefend\convoyDefend_init.sqf";
