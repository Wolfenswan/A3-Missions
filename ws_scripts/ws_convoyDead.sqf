["ConvoyDead"] call bis_fnc_showNotification;

_hc = [] call ws_fnc_checkHC;
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && _hc)) then {

[CSAT,250,independent,10] call ws_fnc_createGarrison;
[CSAT_1,15,independent,6] call ws_fnc_createGarrison;

};


if (isServer) then {

	ws_convoy_dead = true; publicVariable "ws_convoy_dead";

	f_script_setLocalVars = [0] execVM "f\common\f_setLocalVars.sqf";

	waitUntil {sleep 0.1;scriptDone f_script_setLocalVars};

	[] execVM "f\setAISkill\f_setAISkill.sqf";


	[f_var_men_players,tr1,150,2,false] execVM "f\EandEcheck\f_EandECheckLoop.sqf";

};