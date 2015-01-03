disableSerialization;

sleep 6;

while {isNil {player getVariable "zombie"}} do {
	_unit=player;
	if (!isNil {player getVariable "spectating"}) then {_unit=player getVariable "spectating"};
	sleep 0.5;
	waitUntil {!CLY_cutscene};
	if (damage _unit>0.28) then {
		cutRsc ["hud","PLAIN"];
		_ui=uiNamespace getVariable "hud";
		_hud=_ui displayCtrl 23501;
		_hud ctrlSetPosition [safeZoneX,safeZoneY+safeZoneH-0.08];
		_claw="";
		if (damage _unit>0.28) then {_claw="claw1.paa"};
		if (damage _unit>0.59) then {_claw="claw2.paa"};
		if (damage _unit>0.9) then {_claw="claw3.paa"};
		_hud ctrlSetText _claw;
		_hud ctrlCommit 0;
	};
};