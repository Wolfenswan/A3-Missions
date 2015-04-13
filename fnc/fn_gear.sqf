// WS - gearing function

_unit = _this select 0;

if !(local _unit) exitWith {};

_wp = _this select 1;
_items = (_this select 2) + ["ItemMap","ItemCompass","ItemWatch"];
_magazines = if (count _this > 3) then {_this select 3};

//Setup gear
if !(isNil backpack _unit) then {
	clearAllItemsFromBackpack _unit
};

removeallItems _unit;
removeAllAssignedItems _unit;
removeAllWeapons _unit;
_unit removeWeapon primaryWeapon _unit;
_unit removeWeapon secondaryWeapon _unit;
_unit removeWeapon handgunWeapon _unit;

if (faction _unit == "civ_f") then {_unit addVest "V_Rangemaster_belt"};

if (count _wp != 0) then {[_unit, _wp select 0, _wp select 1] call BIS_fnc_addWeapon;};

removeAllPrimaryWeaponItems _unit;
_unit addPrimaryWeaponItem "acc_flashlight";
_unit addSecondaryWeaponItem "acc_flashlight";

{
	_unit linkItem _x;
	if !(_x in assignedItems _unit) then {_unit addItemToVest _x; };
} forEach _items;

{
	_unit addMagazines [_x select 0,_x select 1];
} forEach _magazines;

if (count backpackCargo _unit == 0) then {
	removeBackpack _unit;
};

{_unit addItem "FirstAidKit";} forEach [1,2,3,4];

_unit