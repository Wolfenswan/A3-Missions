	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013 Nicolas BOITEUX

	Dynamic Civilian Life

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
	*/

sleep 0.1;

	private [
		"_allunits",
		"_buildings",
		"_civil",
		"_index",
		"_group",
		"_position",
		"_positions"
	];

	_allunits = [];
	_positions = [];

	_group = _this select 0;

	_group setcombatmode "BLUE";
	_group allowfleeing 0;
	_group setspeedmode "limited";
	_group setBehaviour "careless";

	{
		_x setbehaviour "safe";
		_x allowFleeing 0;
		_x setSpeedMode "Limited";
		_x setvariable ["lastpos", position _x, false];
		_x setvariable ["destination", position _x, false];
		_x setvariable ["moveretry", 0, false];
		_x setunitpos "UP";
	} foreach (units _group);

	_position = position (leader _group);
	_buildings = nearestObjects[_position,["House_F"], 250];
	sleep 1;

	{
		_index = 0;
		while { format ["%1", _x buildingPos _index] != "[0,0,0]" } do {
			_position = _x buildingPos _index;
			_positions = _positions + [_position];
			_index = _index + 1;
		};
	}foreach _buildings;

	while { count (units _group) > 0 } do {
		if(count _allunits == 0) then {
			_allunits = units _group;
		};

		_civil = _allunits select 0;
		_allunits = _allunits - [_civil];

		// exclude all non civilian
		if (_civil getvariable "civilrole" == "civil") then {
			if(position _civil distance (_civil getvariable "destination") < 8) then {
				_position = _positions call BIS_fnc_selectRandom;
				_civil setvariable ["destination", _position, false];
				_civil stop false;
				_civil domove _position;
				_civil setSpeedMode "Limited";
				_civil setvariable ["moveretry", 0, false];
			} else {
				_civil stop false;
				_civil domove (_civil getvariable "destination");
				_civil setSpeedMode "Limited";
			};

			if(format["%1", _civil getvariable "lastpos"] == format["%1", position _civil]) then {
				_civil setvariable ["moveretry", (_civil getvariable "moveretry") + 1, false];
			};

			_civil setvariable ["lastpos", position _civil, false];

			if(_civil getvariable "moveretry" > 3) then {
				_position = _positions call BIS_fnc_selectRandom;
				_civil stop false;
				_civil setvariable ["destination", _position, false];
				_civil domove _position;
				_civil setSpeedMode "Limited";
				_civil setvariable ["moveretry", 0, false];
			};
			sleep 5;
		};
	};