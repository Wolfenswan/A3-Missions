private ["_b"];

// Clear the area
//_b = "Bo_GBU12_LGB" createVehicle [ws_wreckLoc select 0,ws_wreckLoc select 1,2];

// Place the wreck after a sleep
sleep 2;
Wreck setPosATL ws_wreckLoc;
Wreck setdir (random 360);
Wreck setVectorUp (surfaceNormal ws_wreckLoc);
Wreck setVelocity [0,0,0];
clearItemCargoGlobal Wreck; clearBackpackCargoGlobal Wreck; clearWeaponCargoGlobal Wreck;

Wreck addEventHandler [
"HandleDamage",
{
 _box = _this select 0;
 _ammoName = _this select 4;

 if (_ammoName == "DemoCharge_Remote_Ammo") exitWith {[_box] execVM "ws_scripts\ws_wreck_destroyed.sqf";};
 0
}];

ws_wreckPlaced = true; publicVariable "ws_wreckPlaced";