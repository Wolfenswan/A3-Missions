if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

{_x disableTIEquipment true;} forEach [];
{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [];
{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

[Veh,Grp] call ws_fnc_loadVehicle;

ws_initDone = true;