if !(isServer) exitWith {};

f_script_setLocalVars = [0] execVM "f\common\f_setLocalVars.sqf";

waitUntil {sleep 0.1;scriptDone f_script_setLocalVars};

{
 [_x,"f_fnc_gUnCache",true,false] spawn BIS_fnc_MP;
} forEach [c1,c2,c3,c4,c5,c6,c7,VehCSAT_MH1,VehCSAT_MH2];
{
   deleteVehicle _x;
} forEach f_var_men_res;

private ["_cnvmkrs"];
_cnvmkrs = ["mkrConv"] call ws_fnc_collectMarkers;
[_cnvmkrs,[c1,c2,c3,c4,c5,c6,c7],true] execVM "convoyDefend\convoyDefend_init.sqf";
