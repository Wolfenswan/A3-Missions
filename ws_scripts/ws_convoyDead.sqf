hint "convoy dead";

if (isServer) then {
	f_script_setLocalVars = [0] execVM "f\common\f_setLocalVars.sqf";

	waitUntil {sleep 0.1;scriptDone f_script_setLocalVars};

	[f_var_men_players,tr1,100,1] execVM "f\EandEcheck\f_EandECheckLoop.sqf";
	[f_var_men_players,tr2,100,1] execVM "f\EandEcheck\f_EandECheckLoop.sqf";
};