_killed = _this select 0;
_killer = _this select 1;

if (hasInterface && (player == _killer)) then {

	if (side _killer != civilian) then {
		systemChat format["You killed %1 but it seems they weren't a threat. You must file some paperwork at the station to get your primary weapon back.",name _killed];
		player setVariable["qry_paperWork",true];
		player removeWeapon 'SMG_02_F';
	} else {
		systemChat format["You killed %1 who was a harmless guy just minding his own bussiness, you will lose 2 minutes of lifetime.",name _killed];
	    qry_hp = qry_hp - 120;
	    player setVariable["qry_hp",qry_hp,true];
	};
};