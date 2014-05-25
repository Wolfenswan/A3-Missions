if !(isServer) exitWith {};

/*
{
   deleteVehicle _x;
} forEach f_var_men_res;
*/

sleep 10;

player globalchat "convoy moving";

private ["_cnvmkrs"];
_cnvmkrs = ["mkrConv"] call ws_fnc_collectMarkers;
[_cnvmkrs,[c1,c2,c3,c4,c5,c6,c7],true] execVM "convoyDefend\convoyDefend_init.sqf";
