hint "convoy dead";

if (isServer) then {

	ws_convoy_dead = true; publicVariable "ws_convoy_dead";

	f_script_setLocalVars = [0] execVM "f\common\f_setLocalVars.sqf";

	waitUntil {sleep 0.1;scriptDone f_script_setLocalVars};

	[f_var_men_players,tr1,150,2] execVM "f\EandEcheck\f_EandECheckLoop.sqf";
};