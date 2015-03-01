private["_unit"];
_unit = _this select 0;
if (local _unit) then {
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeBackpack _unit;
	removeAllWeapons _unit;
	removeHeadgear _unit;
	removeVest _unit;

	_unit forceAddUniform "U_C_Poor_2";
	_unit addHeadgear 'H_Cap_police';
    _unit addVest 'V_TacVest_blk_POLICE';

   _unit addMagazines["30Rnd_9x21_Mag",6];
   _unit addWeapon 'SMG_02_F';

    //_unit addPrimaryWeaponItem 'optic_ACO_grn';
    _unit addPrimaryWeaponItem 'acc_flashlight';
    //FIX
    _unit addMagazines["16Rnd_9x21_Mag",3];
    _unit addWeapon 'hgun_Rook40_F';

	_unit addMagazines["SmokeShell",1];
	_unit addMagazines["Chemlight_blue",3];

	_unit addItem "FirstAidKit";
	_unit addWeapon "Binocular";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	// 148

};


