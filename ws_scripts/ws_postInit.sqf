ws_ishc = [] call ws_fnc_checkHC;

// Display a short text intro
if (!isDedicated && !ws_ishc) then {
 ["MORNING SORTIE","CENTRAL ALTIS"] spawn {
	 waitUntil {time > 15};
		[
			[
				[_this select 0, "<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",5],
				[_this select 1,"<t align = 'center' shadow = '1' size = '0.8'>%1</t><br/>",5],
				 [format ["%3/%2/%1 %4:%5",date select 0, date select 1, date select 2,date select 3, date select 4],"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",10]
			] , 0, 0.7
		] spawn BIS_fnc_typeText;
	};
};

// Do stuff on either HC or Server (e.g. spawning)
waitUntil {!isNil "ws_param_hc"};
if ((ws_param_hc == 0 && isServer) || (ws_param_hc == 1 && ws_ishc)) then {
	// ws_fnc_createGarrison;
	[galati,200,west,4 + round (count playableUnits/5)] spawn ws_fnc_createGarrison;
	[abdera,200,west,4 + round (count playableUnits/4)] spawn ws_fnc_createGarrison;
	[top,100,west,6 + round random 4] spawn ws_fnc_createGarrison;
	[outpost,300,west,6] spawn ws_fnc_createGarrison;
	[outpost_1,100,west,3 + round random 3] spawn ws_fnc_createGarrison;
	[outpost_2,100,west,3 + round random 3] spawn ws_fnc_createGarrison;
};

// Do more stuff on the server
if (isServer) then {
	// If units were spawned, AI skill is set again
	[] execVM "f\setAISkill\f_setAISkill.sqf";
};