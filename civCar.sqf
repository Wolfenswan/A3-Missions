if (isServer) then {
	_unit = _this select 0;
	

	
	if ((count _this) == 1) then { // don't move if 2nd paramter.
		waitUntil{!isNil "SHK_pos"};
		_unit setPos (["spawnArea",0,"not_useful",_unit] call SHK_pos);
	};
	
	
	//Issue the gear
	clearWeaponCargoGlobal _unit;
	clearMagazineCargoGlobal _unit;
	clearItemCargoGlobal _unit;
	clearBackpackCargoGlobal _unit;
	
	//Random gear
	_gearOpt = round random 9; // this means default is more likely.
	switch (_gearOpt) do {
		case 0:	{
			_unit addWeaponCargoGlobal ["hgun_ACPC2_F", 1];
			_unit addMagazineCargoGlobal ["9Rnd_45ACP_Mag",4];
		};
		case 1: {
			_unit addmagazines["DemoCharge_Remote_Mag",2];
		};
		case 2: {
			_unit addMagazineCargoGlobal ["9Rnd_45ACP_Mag",2];
			_unit addMagazineCargoGlobal ["11Rnd_45ACP_Mag",1];
			_unit addMagazineCargoGlobal ["16Rnd_9x21_Mag",1];
		};
		case 3: {
			_unit addItemCargoGlobal ["FirstAidKit",1];
		};
		default {
			
		};
	};

};