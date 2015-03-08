//Zombie mission init script by Celery

cutText ["","BLACK FADED",1];

//Time and weather
switch CLY_timeofday do {
case 1:
	{
		setDate [2030, 6,7, 19,15];
	};
case 2:
	{
		setDate [2030, 6,7, 0, 0];
	};
case 3:
{
	setDate [2030, 6,7, 4, 15];
};
};

switch CLY_Weather do {
	case 1:
	{
		0 setOvercast 0.3;
		0 setRain 0;
		0 setRainbow 0;
		0 setWindStr  0.3;
		0 setWindForce 0.3;
		0 setWaves 0.3;
	};
	case 2:
	{
		0 setOvercast 0.5;
		0 setRain 0.1;
		0 setRainbow 0;
		0 setWindStr  0.3;
		0 setWindForce 0.3;
		0 setWaves 0.3;
	};
	case 3:
	{
		0 setOvercast 1;
		0 setLightnings 1;
		0 setRain 0.7;
		0 setRainbow 0;
		0 setWindStr  1;
		0 setWindForce 1;
		0 setWaves 0.3;
		if (isServer) then {[] execVM "ws_storm.sqf";};
	};
};

/*
switch CLY_FOG do {
	case 1:
	{
	};
	case 2:
	{
		0 setFog CLY_fog;
	};
	case 3:
	{
		0 setFog CLY_fog;
	};
};*/

0 setFog CLY_fog;

forceWeatherChange;
setViewDistance 500;

//Disable saving
enableSaving [false,false];

//Disable radio
enableRadio false;

//CLY Remove Dead
[45,0] execVM "cly_removedead.sqf";
player setVariable ["CLY_removedead",false,true];

// Set default view mode
setAperture -1;
player removeEventHandler ["HandleDamage", 0];

//Zombie damage handling
CLY_zombiehandledamage={
	_this addEventHandler [
		"HandleDamage",
		{
			_unit=_this select 0;
			_damage=_this select 2;
			_gethit=[0,0,0,0];
			if (!isNil {_unit getVariable "gethit"}) then {_gethit=_unit getVariable "gethit"} else {_unit setVariable ["gethit",[0,0,0,0]]};
			_multiplier=if (typeOf player in WS_zombieclasses) then {0.5} else {1};
			if (_this select 3!=_unit) then {
				switch (_this select 1) do {
					case "":{_damage=damage _unit+_damage*0.1};
					case "head_hit":{_damage=(_gethit select 0)+(_damage-(_gethit select 0))*(2*_multiplier);_gethit set [0,_damage];_unit setVariable ["gethit",_gethit]};
					case "body":{_damage=(_gethit select 1)+(_damage-(_gethit select 1))*(0.25*_multiplier);_gethit set [1,_damage];_unit setVariable ["gethit",_gethit]};
					case "legs":{_damage=(_gethit select 3)+(_damage-(_gethit select 3))*(0.45*_multiplier);_gethit set [3,_damage];_unit setVariable ["gethit",_gethit]};
				};
			};
			_unit setHitPointDamage ["hitHead", 0.99];
			_unit setHitPointDamage ["hitBody", 0.99];
			_unit setHitPointDamage ["hitHands", 0.99];
			_unit setHitPointDamage ["hitLegs", 0.4];
		_damage
		}
	];
};

/////No dedicated after this/////
if (isDedicated) exitWith {};
/////No dedicated after this/////

/*
CLY_locationarea=createTrigger ["EmptyDetector",getPos CLY_location];
CLY_locationarea setTriggerArea (triggerArea CLY_Location);
CLY_locationarea setTriggerActivation ["ANY","PRESENT",true];
CLY_locationarea setTriggerStatements ["this","",""];
*/

//GPS
//Ugly code alert (could/should prob. rewrite this into something slicker but can't be arsed ~ws)
if !(player getVariable ["scientist",false]) then {
	[] spawn {
		_markers=[];
		for "_x" from 1 to 30 do {
			_marker=createMarkerLocal [format ["marker%1",_x],getPos player];
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerSizeLocal [0.3,0.6];
			_marker setMarkerAlphaLocal 0;
			_markers set [count _markers,_marker];
		};
		sleep 0.1;
		while {true} do {
			if (isNil {player getVariable "zombie"} && "ItemGPS" in assigneditems player) then {
				_units=[];
				{if (isNil {_x getVariable "zombie"}) then {_units set [count _units,_x]}} forEach allUnits;
				_i=0;
				{
					if (count _units>_i) then {
						_unit=_units select _i;
						_x setMarkerColorLocal "ColorBlue";
						_x setMarkerTextLocal name _unit;
						_x setMarkerPosLocal getPos _unit;
						_x setMarkerDirLocal getDir _unit;
						_x setMarkerAlphaLocal 1;
					} else {
						_x setMarkerAlphaLocal 0;
					};
					_i=_i+1;
				} forEach _markers;
			};

			if (!isNil {player getVariable "zombie"}) then {
				_units=[];
				{if (!isNil {_x getVariable "zombie"}) then {_units set [count _units,_x]}} forEach allUnits;
				_i=0;
				{
					if (count _units>_i) then {
						_unit=_units select _i;
						_x setMarkerColorLocal "ColorRed";
						_x setMarkerTextLocal name _unit;
						_x setMarkerPosLocal getPos _unit;
						_x setMarkerDirLocal getDir _unit;
						_x setMarkerAlphaLocal 1;
					} else {
						_x setMarkerAlphaLocal 0;
					};
					_i=_i+1;
				} forEach _markers;
			};

			sleep 0.2;

			if (!("ItemGPS" in assigneditems player) && isNil {player getVariable "zombie"}) exitWith {};
		};
	};
} else {
	[] spawn {
		_markers=[];
		for "_x" from 1 to 30 do {
			_marker=createMarkerLocal [format ["marker%1",_x],getPos player];
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerSizeLocal [0.3,0.6];
			_marker setMarkerAlphaLocal 0;
			_markers set [count _markers,_marker];
		};

		sleep 0.1;
		while {true} do {
			if ("ItemGPS" in assigneditems player) then {
				_units=[];
				{if !(isNil {_x getVariable "zombie"}) then {_units set [count _units,_x]}} forEach allUnits;
				_i=0;
				{
					if (count _units>_i) then {
						_unit=_units select _i;
						_x setMarkerColorLocal "ColorRed";
						_x setMarkerTextLocal name _unit;
						_x setMarkerPosLocal getPos _unit;
						_x setMarkerDirLocal getDir _unit;
						_x setMarkerAlphaLocal 1;
					} else {
						_x setMarkerAlphaLocal 0;
					};
					_i=_i+1;
				} forEach _markers;
			};

			sleep 0.2;

			if (!("ItemGPS" in assigneditems player) && isNil {player getVariable "zombie"}) exitWith {};
		};
	};
};


//Claw mark HUD
execVM "cly_hud.sqf";

//Briefing
player createDiaryRecord ["Diary",["Briefing","<br/>Infection: Altis<br/><br/>A zombie apocalypse is about to sweep over Altis. All it takes is one little zombie that gets through the quarantine and starts infecting people. This is the story of one such occurrence.<br/><br/>The mission starts with one zombie against everyone else. Every dead survivor will respawn as a zombie, and their new task is to kill their former comrades. The mission ends when time is up or everyone has turned into a zombie. The original zombie always kills on the first hit, the others need two.<br/><br/>
Use only DIRECT, GROUP or VEHICLE VON to communicate.
		<br/><br/>
	Survivors can join other players by facing them and selecting the 'Join Group' action. When in a group you can leave it using the 'Leave Group' action.<br/><br/>"]];

player createDiaryRecord ["Diary",["Zombie instructions","<br/>Attacking: Press the primary mouse button when a survivor is in front of you to attack him. If you're the original zombie, you need only one hit to kill him, otherwise you need to hit him twice.<br/><br/>Moaning: Press the primary mouse button when not in attacking range of a survivor. In addition to scaring your enemies, moaning will help you find them and mark them on the map for a brief period of time.<br/><br/>Jumping: Lie down and hold and release the primary mouse button to jump in the direction you're looking. You can cancel your jump by pressing the secondary mouse button. You will automatically attack survivors that cross your path during your jump."]];

player createDiaryRecord ["Diary",["Credits","<br/>Mission and scripts:<br/>Celery<br/><br/>Noises and screams:<br/>Thief II: The Metal Age and freesound.org<br/><br/>Ported to Arma3 by Wolfenswan for Folk ARPS"]];

if (isNil {player getVariable "zombie"})  then {
	obj1=player createSimpleTask [""];
	obj1 setSimpleTaskDescription ["<br/>Your only goal is to stay alive. A horrible fate worse than death awaits you should you die.","Survive",""];
	player setCurrentTask obj1;
	[] spawn {
		sleep 4;
		["TaskAssigned",["Survive!"]] call bis_fnc_showNotification;
	};

	// F3 - Join Group Action
	// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

	[false] execVM "f\f_groupJoinAction.sqf";
};

if (!isNil {player getVariable "zombie"}) then {
	obj2=player createSimpleTask [""];
	obj2 setSimpleTaskDescription ["<br/>You are a zombie. You must kill everyone.","Kill all the survivors",""];
	player setCurrentTask obj2;
	["TaskAssigned",["Kill!"]] call bis_fnc_showNotification;

	[] spawn {
		sleep 4;
		["TaskAssigned",["Kill all the Survivors!!"]] call bis_fnc_showNotification;
	};
};

//CLY Jukebox
[
	1,
	["Fallout",0,207,0.35],
	["Wasteland",0,195,0.35],
	["MAD",0,196,0.35]
] execVM "cly_jukebox.sqf";

//Color filter
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1,1,0,[0,0,0,0],[0.3,0.3,0.3,1.3],[1,1,1,0]];
"colorCorrections" ppEffectCommit 0;

//Claw script
CLY_z_claw={
	_victim=_this select 0;
	_claw=_this select 1;
	if (player==_victim) then {
		titleRsc [format ["claw%1",_claw],"PLAIN"]
	} else {
		if (!isNil {player getVariable "spectating"}) then {
			if (player getVariable "spectating"==_victim) then {
				titleRsc [format ["claw%1",_claw],"PLAIN"];
			};
		};
	};
	true
};


//Public variable event handlers
"CLY_z_noisepv" addPublicVariableEventHandler {
	_var=_this select 1;
	_zombie=_var select 0;
	_zombie say3D (_var select 1);
};
"CLY_z_attackpv" addPublicVariableEventHandler {
	_var=_this select 1;
	_zombie=_var select 0;
	_sound=_var select 1;
	_anim=if (count _var>2) then {_var select 2} else {""};
	_object="HeliHEmpty" createVehicleLocal [0,0,0];
	_object attachTo [_zombie,[0,0,1.5]];
	_object say3D _sound;
	if (_anim!="") then {_zombie switchMove _anim};
	[_object] spawn {sleep 10;deleteVehicle (_this select 0)};
};
"CLY_z_victimpv" addPublicVariableEventHandler {
	_var=_this select 1;
	_victim=_var select 0;
	_sound=_var select 1;
	_claw=_var select 2;
	_object="HeliHEmpty" createVehicleLocal [0,0,0];
	_object attachTo [_victim,[0,0,1.5]];
	if (_sound!="") then {_object say3D _sound};
	_object spawn {sleep 5;deleteVehicle _this};
	if (_claw>0) then {[_victim,_claw] call CLY_z_claw};
};

// Setup Zombie
[] execVM "cly_playerzombie.sqf";