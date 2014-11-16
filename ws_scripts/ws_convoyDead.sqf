["ConvoyDead"] call bis_fnc_showNotification;

_hc = [] call ws_fnc_checkHC;
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && _hc)) then {

[CSAT,150,independent,12] call ws_fnc_createGarrison;
[CSAT_1,15,independent,6] call ws_fnc_createGarrison;

};


if (isServer) then {

	ws_convoy_dead = true; publicVariable "ws_convoy_dead";

	[] execVM "f\setAISkill\f_setAISkill.sqf";

	[(playableUnits - allDead),tr1,150,2,false] execVM "f\EandEcheck\f_EandECheckLoop.sqf";

};