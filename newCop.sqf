private["_unit"];
_unit = _this select 0;
if (local _unit) then {
	removeUniform _unit;
	removeBackpack _unit;
	removeallweapons _unit;
	removeheadgear _unit;
	_unit unassignItem "NVGoggles";
	_unit removeItem "NVGoggles";
	removeVest _unit;

};
waitUntil{!isNil "playerList"};
waitUntil {time > 1};
sleep 1;
_unit forceAddUniform "U_C_Poor_2";
if (local _unit) then {
    //attempt removing everything before uniform...
	_unit removeItem "ItemRadio";

	//_uniforms = ["U_C_Poor_2"];
	//removeUniform _unit;
	// (_uniforms call BIS_fnc_selectRandom);

	 _unit addheadgear 'H_Cap_police';
	//removeUniform _unit;
	//Workaround until addUniform is global...
	//sleep 1;
	//[[{}, _unit addUniform "U_C_Poor_2"], "BIS_fnc_spawn", true] call BIS_fnc_MP;
	//if (isDedicated) then {

	//};
	//Does not execute on dedi server?

	//[[_unit, {_this addUniform "U_C_Poor_2"}], "BIS_fnc_spawn", true] call BIS_fnc_MP;
	//_unit adduniform 'U_C_Poor_2';

    _unit addVest 'V_TacVest_blk_POLICE';

    _unit addmagazines["30Rnd_9x21_Mag",6];
    _unit addWeapon 'SMG_02_F';

    _unit addPrimaryWeaponItem 'optic_ACO_grn';
    _unit addPrimaryWeaponItem 'acc_flashlight';
    _unit addWeapon 'hgun_P07_F';
	_unit addmagazines["SmokeShell",1];
	_unit addmagazines["Chemlight_blue",3];
	_unit addmagazines["16Rnd_9x21_Mag",3];
	_unit addWeapon "Binocular";
	_unit addItem "ItemGPS";
	_unit assignItem "ItemGPS";
	// 148

};