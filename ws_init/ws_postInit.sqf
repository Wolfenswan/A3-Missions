ws_isHC = [] call ws_fnc_checkHC;

// On neither the server nor the HC
if (!isDedicated && !ws_isHC) then {

	// Display a short text intro
 	[] spawn {
	 waitUntil {time > 15};
		["NEUROMANCER","VIRTUAL REALITY"] call ws_fnc_showIntro;
		playMusic "Neuromancer";
	};
};

// Do more stuff exclusively on the server
if (isServer) then {
	["vrareamarker", 25, 6] execVM "scripts\Zen_GenerateVRArea.sqf";
	resistance setFriend [east,1];
	resistance setFriend [west,1];
	east setFriend [resistance,1];
	west setFriend [resistance,1];

	[] spawn {
		_civs = {side _x == civilian || side _x == resistance} count allUnits;

		while {true} do {
			if ((({side _x == civilian || side _x == resistance} count allUnits)) < _civs) then {
				resistance setFriend [east,0];
				resistance setFriend [west,0];
				east setFriend [resistance,0];
				west setFriend [resistance,0];
			};
			sleep 1;
		};
	};
};