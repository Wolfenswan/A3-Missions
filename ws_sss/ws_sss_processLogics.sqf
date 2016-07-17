/* WOLFENSWAN's SIMPLE SPAWN SYSTEM */

// Collect all controllers
private _logics = [ws_sss_controller] call ws_fnc_collectObjectsNUm;

// Process controllers
{
	private _logic = _x;
	private _arr1 = [];
	private _arr2 = [];

	{
		// Synchronized Group leaders
		if (_x isKindOf "Man" && {!(group _x in _arr1)}) then {
			_arr1 pushback (group _x);
		};

		// Synchronized Triggers
		if (_x isKindOf "EmptyDetector") then {
			private _trg = _x;

			// Process objects synced to the trigger
			private _pois = [];
			{
				// If a config logic is present, transfer it's settings to the trigger
				if (_x getVariable ["config",false]) then {
					_trg setVariable ["maxGroups",(_x getVariable ["maxGroups",-1])];
				};

				// Process the POIs
				if (_x getVariable ["poi",false]) then {
					_x setVariable ["groupspresent",[]];
					_pois pushback (_x);
				};
			} forEach synchronizedObjects _trg;
			_trg setVariable ["pois",_pois];
			_trg setVariable ["groupspresent",[]];
			_arr2 pushBack (_trg);

		};
	} forEach synchronizedObjects _logic;
	_logic setVariable ["groups",_arr1];
	_logic setVariable ["triggers",_arr2];
	_logic setVariable ["groupspresent",[]];

} forEach _logics;