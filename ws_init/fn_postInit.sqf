// Set up variables
if (isNil "ws_wreckPlaced") then {ws_wreckPlaced = false};
if (isNil "ws_colonel_extracted") then {ws_colonel_extracted = false};
if (isNil "ws_colonel_killed") then {ws_colonel_killed = false};
if (isNil "ws_wreck_destroyed") then {ws_wreck_destroyed = false};

if (str vehicle player in ["UnitZeus","UnitZeus_1"]) then {
	player setPos ws_wreckloc;
	_mkr = createMarkerLocal  ["mkrZeus", ws_wreckloc];
	_mkr setMarkerTypeLocal "mil_dot";
	_mkr setMarkerTextLocal "Crashsite";
	_mkr setMarkerColorLocal "ColorRed";
};

// Display a short text intro
if (!isDedicated) then {
	// Display a short text intro
 	[] spawn {
 	sleep 0.1;

 	if (vehicle player == WRECK) then {
 		showGPS false;
		showMap false;

		if ("ws_param_compass" call bis_fnc_getParamValue == 0) then {
			player unlinkItem "ItemCompass";
		};
	};

	 waitUntil {time > 10};
		["Jolly Green Hell","Somewhere on Tanoa"] call ws_fnc_showIntro;
	};
};

// Do more stuff exclusively on the server
if (isServer) then {
	[] execVM "ws_scripts\ws_wreck.sqf";

	if (isNil "UnitNATO_VIP") then {
		ws_colonel_extracted = true; publicVariable "ws_colonel_extracted";
	};
};

//Show black screen while waiting for wreck to be placed/explosion cleared
[] spawn {
	waitUntil { time > 0 };
	player allowDamage false;
	player enableSimulation false;
	while {!(ws_wreckPlaced)} do {
		_dots = "";
		for "_i" from 0 to 3 do {
		titleText [format["Setting up%1",_dots], "BLACK FADED", 0];
		_dots = _dots + ".";
		sleep 0.3;};
	};
	player allowDamage true;
	player enableSimulation true;
	titleFadeout 1;

	setViewDistance 2000;
	curatorCamera setPosATL [ws_wreckLoc select 0,ws_wreckLoc select 1,30];
	// Make Wreck smoke
	[Wreck,"oil","large",0] execVM "ws_scripts\smokecolumn.sqf";
};
