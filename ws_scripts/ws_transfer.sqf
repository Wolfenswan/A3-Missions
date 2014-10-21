

[
	_this call
	{
		private ["_object","_caller","_id","_laptop","_mkr","_time","_i"];

		_object = _this select 0;
		_caller = _this select 1;
		_id = _this select 2;

		_object removeAction _id;

		if (isServer) then {
			_laptop = "Land_Laptop_unfolded_F" createVehicle (getPosATL _caller);
			_laptOp setPos (getPosATL _caller);

			// Create Marker indicating the location
			_mkr = createMarker ["mkrLaptop",(getPosATL _laptop)];
			_mkr setMarkerType "mil_triangle";
			_mkr setMarkerSize [0.3,0.3];
			_mkr setMarkerColor "colorGreen";
		};

		// Display countdown for players
		_time = ws_param_timer;
		_i = 0;

		while {_i < _time && damage Wreck < 1} do {
			_str = "Transfering";
			for "_x" from 0 to 6 do {
				cutText [format ["%1 \n Time remaining: %2 seconds",_str,(_time - _i)],"PLAIN DOWN",0.5];
				_str = _str + ".";
				_i = _i + 1;
				sleep 1;
			};
		};

			if (!alive Wreck) exitWith {
			};

		["TransferComplete"] call bis_fnc_showNotification;
		// TODO Set completed task?

		_laptop addAction ["<t color='#dddd00'>"+"Collect data"+"</t>",
			"ws_scripts\ws_collectData.sqf",
			[(_this select 0),(_this select 1),(_this select 2)],1,false,true,"",
			"((_target distance _this) < 2)"];
	}
,"BIS_fnc_spawn",true] spawn BIS_fnc_MP;	// Note to self: change resistance to true for COOP