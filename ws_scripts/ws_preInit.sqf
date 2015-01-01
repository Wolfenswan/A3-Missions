
if (isNil "ws_initDone") then {ws_initDone = false};

ws_debug = if (ws_param_dbg == 0) then {false} else {true};

if !(isServer) exitWith {ws_initDone = true};

// Disable Thermal Imaging for these vehicles
{_x disableTIEquipment true;} forEach [];

// Further tweaking to vehicles
//{_x removeWeaponGlobal "GMG_40mm"; _x lockTurret [[1],true];} forEach [];
//{_x removeWeaponGlobal "HMG_127_APC";_x lockTurret [[0],true];} forEach [];

ws_initDone = true;