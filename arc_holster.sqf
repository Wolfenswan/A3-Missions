//
//	arc_holster.sqf
//	Sidearm-Holster-script by Arctorkovich
// Fixed by Snippers (as wasn't broken......)
// in init.sqf put:
// 
// if (!isDedicated) then
// {
//		holstered = 0;  
//		player addAction ["Holster sidearm","arc_holster.sqf",nil,2.5,false,true,"",""];
//  };

if (isDedicated) exitWith {};

private ["_unit","_holstered"];

_id = _this select 2;
_unit = player;
_holstered = holstered;

switch (_holstered) do
{
	case 0:
	{
		class_weapon = currentWeapon _unit;
		
		if (currentWeapon _unit != handgunWeapon _unit) exitWith 
		{
			hint "Equip your sidearm first!";
		};
		
		_unit removeAction _id;
				
		
		A_mag = handgunMagazine _unit select 0;
		b_count = _unit ammo class_weapon;
		
		_unit removeWeapon class_weapon;
		
		holstered = 1;
		_unit addAction ["Draw sidearm","arc_holster.sqf",nil,2.5,false,true,"",""];
        _unit setVariable ["qry_hadWeapon",time,true];
	};
	case 1:
	{
		_unit removeAction _id;
		
		//for "_i" from 0 to ((count A_mags)-1) do
		//{
		//	_unit addMagazine (A_mags select _i);
		//};
		if (b_count > 0 && A_mag != "") then {
			_unit addMagazine [A_mag,b_count];
			_unit setAmmo [handgunWeapon _unit, b_count];
		};
		_unit addWeapon class_weapon;
		_unit selectWeapon class_weapon;
		
		holstered = 0;
		_unit addAction ["Holster sidearm","arc_holster.sqf",nil,2.5,false,true,"",""];
	};
};

if (true) exitWith {};