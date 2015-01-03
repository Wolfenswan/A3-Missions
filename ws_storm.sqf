while {true} do {
	sleep 15 + random 35;
	_pos = [CLY_LOCATION,(triggerArea CLY_Location select 0)*1.5,(triggerArea CLY_Location select 0)+50] call ws_fnc_getPos;
	[_pos,"ws_fnc_createLightning",true] call BIS_fnc_MP;
};