if !(isServer) exitWith {};

_box = _this select 0;
_box setDamage 1;

[["WreckDestroyed",["The helicopter has been destroyed!"]],"bis_fnc_showNotification",true] spawn BIS_fnc_MP;

ws_wreck_destroyed = true; publicVariable "ws_wreck_destroyed";