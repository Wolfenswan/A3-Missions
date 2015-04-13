//Player is a zombie
waitUntil {!isNil "BIS_fnc_inTrigger"};
_altobject="HeliHEmpty" createVehicleLocal [0,0,0];
if (isNil {player getVariable "zombie"}) then {
	_pos=[0,0,0];
	_radius=(triggerArea CLY_location select 0) max (triggerArea CLY_location select 1);
	_relocate=true;

	while {_relocate} do {
		_pos=[(getPos CLY_location select 0)-_radius+random _radius*2,(getPos CLY_location select 1)-_radius+random _radius*2,0];
		if ([CLY_location,_pos] call BIS_fnc_inTrigger and !surfaceIsWater _pos) then {
			_relocate=false;
			_pos = _pos findEmptyPosition [0,50,typeOf player];
		};
	};

	player setVelocity [0,0,0];
	(vehicle player) setPos _pos;
	player setDir random 360;
	cutText ["","BLACK IN",1];
} else {
	[] spawn {
		sleep 3.2;
		cutText ["","BLACK IN",1];
	};
};

player setVariable ["CLY_removedead",false,true];

sleep 0.1;

_doom=0;
CLY_mouse1down=false;
CLY_mouse1up=false;
CLY_mouse2down=false;
_canceljump=false;
findDisplay 46 displayAddEventHandler ["MouseButtonDown","if ((_this select 1)==0) then {CLY_mouse1down=true};if ((_this select 1)==1) then {CLY_mouse2down=true}"];
findDisplay 46 displayAddEventHandler ["MouseButtonUp","if ((_this select 1)==0) then {CLY_mouse1up=true}"];
player setVariable ["BIS_noCoreConversations",true,true];
nv=false;

while {true} do {
	if (!isNil {player getVariable "zombie"}) then {
		if (!isNil "obj1") then {obj1 setTaskState "Failed"};
		[player] joinSilent grpNull;
		if !(isNil "f_groupJoinAction") then {player removeAction f_groupJoinAction};
		if !(isNil "f_groupLeaveAction") then {player removeAction f_groupLeaveAction};
		player linkItem "ItemGPS"; player linkItem "ItemCompass";
		sleep 3;
		if (isNil "obj2" and {isPlayer _x and isNil {_x getVariable "zombie"}} count allUnits>0) then {
			obj2=player createSimpleTask [""];
			obj2 setSimpleTaskDescription ["<br/>You are a zombie. You must kill everyone.","Kill all the survivors",""];
			player setCurrentTask obj2;
			["TaskAssigned",["Kill all the survivors!"]] call bis_fnc_showNotification;
		};
		_startpos= [0,0,0];
		_allsurvivors=[];
		{if (_x isKindOf "Man" and !(_x isKindOf "Animal") and isNil {_x getVariable "zombie"} and _x distance CLY_location<1500) then {_allsurvivors set [count _allsurvivors,_x]}} forEach allUnits;
		_survivors=_allsurvivors;

		while {_startpos select 0==0 and count _survivors>0} do {
			_survivor=_survivors select floor random count _survivors;
			_survivors=_survivors-[_survivor];
			for "_z" from 1 to 10 do {
				if (_startpos select 0==0) then {
					_survivorpos=[getPos _survivor select 0,getPos _survivor select 1,0];
					_x=if (random 1>0.5) then {120+random 130} else {-120-random 130};
					_y=if (random 1>0.5) then {120+random 130} else {-120-random 130};
					_pos=[(_survivorpos select 0)+_x,(_survivorpos select 1)+_y,0];
					_altobject setPos [_pos select 0,_pos select 1,1000];
					if (!surfaceIsWater _pos and (getPos _altobject select 2)==(getPosATL _altobject select 2) and _pos distance _survivorpos<250 and {_pos distance _x<150} count _allsurvivors==0) then {_pos = _pos findEmptyPosition [0,50,typeOf player];_startpos=_pos};
				};
			};
		};
		if (_startpos select 0==0) then {
			_pos=[0,0,0];
			_radius=(triggerArea CLY_location select 0) max (triggerArea CLY_location select 1);
			_relocate=true;
			while {_relocate} do {
				_pos=[(getPos CLY_location select 0)-_radius+random _radius*2,(getPos CLY_location select 1)-_radius+random _radius*2,0];
				_altobject setPos [_pos select 0,_pos select 1,1000];
				if ([CLY_location,_pos] call BIS_fnc_inTrigger and !surfaceIsWater _pos and (getPos _altobject select 2)==(getPosATL _altobject select 2)) then {
					_relocate=false;
					_pos = _pos findEmptyPosition [0,50,typeOf player];
				};
			};
			_startpos=_pos
		};
		waitUntil {alive player};
		player setVariable ["CLY_removedead",nil,true];
		CLY_markercolor="ColorRed";
		"colorCorrections" ppEffectAdjust [1,1,0,[0,0,0,0],[0.3,0.3,0.3,1.3],[1,1,1,0]];
		"colorCorrections" ppEffectCommit 0;
		removeAllWeapons player;
		removeAllItems player;
		removeAllItemsWithMagazines player;
		removeAllAssignedItems player;
		removeBackpack player;
		{player linkItem _x} forEach ["ItemMap"];
		//player switchMove "amovpercmstpsnonwnondnon";


		//SNIPPERS CODE INSERT TO MAKE BLOODY
		removeHeadgear player; removeGoggles player;
		player setFace "GreekHead_A3_04";
		player removeEventHandler ["HandleDamage", 0];

		player setHitPointDamage ["hitHead", 0.99];
		player setHitPointDamage ["hitBody", 0.99];
		player setHitPointDamage ["hitHands", 0.99];
		player setHitPointDamage ["hitLegs", 0.4];


		player addRating -10000;
		player setVelocity [0,0,0];
		player setPos _startpos;

		_nearest=objNull;
		_dist=1000;
		{if (isNil {_x getVariable "zombie"} and !(_x isKindOf "Animal") and player distance _x<_dist) then {_nearest=_x;_dist=player distance _x}} forEach allUnits;
		if (!isNull _nearest) then {
			player setDir ((getPos player select 0)-(getPos _nearest select 0)) atan2 ((getPos player select 1)-(getPos _nearest select 1))+180+random 90-45;
		} else {
			player setDir random 360;
		};
		player spawn CLY_zombiehandledamage;
		_moancooldown=0;
		_jumpcooldown=0;
		moanstring="";
		jumpstring="";
		jumparray=[];
		jumpmode=0.5;
		jumpactionhigh=player addAction ["Jump mode: high","cly_zombieactions.sqs",1,0,false,true,"","_target==_this and jumpmode!=1"];
		jumpactionmedium=player addAction ["Jump mode: medium","cly_zombieactions.sqs",0.5,0,false,true,"","_target==_this and jumpmode!=0.5"];
		jumpactionlow=player addAction ["Jump mode: low","cly_zombieactions.sqs",0.325,0,false,true,"","_target==_this and jumpmode!=0.325"];
		nvactionon=player addAction ["Night vision: on","cly_zombieactions.sqs",true,0,false,true,"","_target==_this and !nv"];
		nvactionoff=player addAction ["Night vision: off","cly_zombieactions.sqs",false,0,false,true,"","_target==_this and nv"];
		[] spawn {
			while {alive player} do {
				waitUntil {!CLY_cutscene};
				_br=if (moanstring=="" or count jumparray==0) then {""} else {"<br/><br/>"};
				hintSilent parseText format ["%1%2%3",moanstring,_br,jumpstring];
				sleep 0.05;
			};
		};
		while {alive player} do {
			waitUntil {!CLY_cutscene};
			if (CLY_mouse1down) then {
				_prone=player selectionPosition "launcher" select 2<0.5372;
				_sound=CLY_noises_idle select floor random count CLY_noises_idle;
				if ({isNil {_x getVariable "zombie"} and !(_x isKindOf "Animal")} count (getPosATL player nearEntities [["Man"],60])>0) then {_sound=CLY_noises_chase select floor random count CLY_noises_chase};
				_victim=objNull;
				_victims=[];
				{if (alive (driver _x) and (driver _x)!=player and isNil {(driver _x) getVariable "zombie"}) then {_victims set [count _victims,(driver _x)]}} forEach (player modelToWorld [0,1,0] nearEntities 1.25);

				if (count _victims>0) then {
					_anim=if (_prone) then {"awopppnemstpsgthwnondnon_end"} else {"awoppercmstpsgthwnondnon_end"};
					player switchMove _anim;
					_sound=CLY_noises_attack select floor random count CLY_noises_attack;
					_victim=_victims select floor random count _victims;
					_damage=if (typeOf player in WS_zombieclasses) then {1} else {damage _victim+0.2};
					_victimsound=CLY_noises_scream select floor random count CLY_noises_scream;
					_object="HeliHEmpty" createVehicleLocal [0,0,0];
					_object attachTo [_victim,[0,0,1.5]];
					_object say3D _victimsound;
					_object spawn {sleep 5;deleteVehicle _this};
					_claw=if (damage _victim+_damage>0.9) then {3} else {2};
					[_victim,_claw] call CLY_z_claw;
					CLY_z_victimpv=[_victim,_victimsound,_claw];
					publicVariable "CLY_z_victimpv";
					_victim setDamage _damage;
				} else {
					if (_prone and time>=_jumpcooldown and count jumparray==0 and getPos player select 2<0.1) then {
						_starttime=time;
						CLY_mouse1up=false;
						CLY_mouse2down=false;
						jumpspeed=8;
						release=false;
						[] spawn {
							sleep 0.25;
							while {!release and count jumparray<40 and alive player} do {
								jumpspeed=jumpspeed+0.3;
								jumparray=jumparray+toArray "|";
								jumpstring=format ["<t align='left' size='1.2' color='#88ff5555'>%1</t>",toString jumparray];
								sleep 0.05;
							};
						};
						waitUntil {CLY_mouse1up or CLY_mouse2down or player selectionPosition "launcher" select 2>=0.5372 or getPos player select 2>=0.1 or !alive player};
						release=true;
						_altobject setPosATL (player modelToWorld [0,1.2,10]);
						_alt=(getPosATL _altobject select 2)-(getPos _altobject select 2)-1;
						if (!CLY_mouse2down and time-_starttime>=0.2 and player selectionPosition "launcher" select 2<0.5372 and getPos player select 2<0.1 and (getPosATL player select 2>_alt or jumpmode<1) and alive player) then {
							player allowDamage false;
							_sound=CLY_noises_attack select floor random count CLY_noises_attack;
							_dir=vectorDir player;
							_jumpspeedxy=if (jumpmode==1) then {jumpspeed*0.35} else {jumpspeed};
							player setVelocity [_jumpspeedxy*(_dir select 0),_jumpspeedxy*(_dir select 1),jumpspeed*jumpmode];
							_jumpcooldown=time+2;
							[] spawn {waitUntil {isTouchingGround player}; player allowDamage true;};
							[] spawn {
								_starttime=time+0.5;
								_cooldown=0;
								while {(getPos player select 2>0.1 or time<_starttime) and alive player} do {
									_victim=objNull;
									_victims=[];
									{if (alive _x and _x!=player and isNil {_x getVariable "zombie"} and (player modelToWorld (player selectionPosition "launcher")) distance (_x modelToWorld (_x selectionPosition "launcher"))<1.5) then {_victims set [count _victims,_x]}} forEach (player modelToWorld [0,0.5,0] nearEntities [["Man"],2.5]);
									if (count _victims>0 and time>=_cooldown and player selectionPosition "launcher" select 2<0.5372) then {
										player switchMove "awopppnemstpsgthwnondnon_end";
										_sound=CLY_noises_attack select floor random count CLY_noises_attack;
										_object="HeliHEmpty" createVehicleLocal [0,0,0];
										_object attachTo [player,[0,0,1.5]];
										_object say3D _sound;
										_object spawn {sleep 5;deleteVehicle _this};
										CLY_z_attackpv=[player,_sound];
										publicVariable "CLY_z_attackpv";
										_victim=_victims select floor random count _victims;
										_damage=if (typeOf player in WS_zombieclasses) then {1} else {damage _victim+0.2};
										_victimsound=CLY_noises_scream select floor random count CLY_noises_scream;
										_object="HeliHEmpty" createVehicleLocal [0,0,0];
										_object attachTo [_victim,[0,0,1.5]];
										_object say3D _victimsound;
										_object spawn {sleep 5;deleteVehicle _this};
										_claw=if (damage _victim+_damage>0.9) then {3} else {2};
										CLY_z_victimpv=[_victim,_victimsound,_claw];
										publicVariable "CLY_z_victimpv";
										_victim setDamage _damage;
										_cooldown=time+1;
									};
									sleep 0.05;
								};
							};

							[] spawn {
								while {count jumparray>0 and alive player} do {
									sleep 0.3;
									jumparray resize count jumparray-1;
									jumpstring=format ["<t align='left' size='1.2' color='#88ff5555'>%1</t>",toString jumparray];
								};
								jumparray=[];
								jumpstring="";
							};
						} else {
							jumparray=[];
							jumpstring="";
							if (time-_starttime>=0.2) then {_canceljump=true};
						};
					};
				};
				if (_sound in CLY_noises_attack) then {
					_object="HeliHEmpty" createVehicleLocal [0,0,0];
					_object attachTo [player,[0,0,1.5]];
					_object say3D _sound;
					_object spawn {sleep 5;deleteVehicle _this};
					CLY_z_attackpv=[player,_sound];
					publicVariable "CLY_z_attackpv";
					sleep 1.95;
					waitUntil {getPos player select 2<0.5};
				} else {
					if (time>=_moancooldown and !visibleMap and !_canceljump) then {
						_nearest=objNull;
						_dist=10000;
						{if (isNil {_x getVariable "zombie"} and !(_x isKindOf "Animal") and player distance _x<_dist) then {_nearest=_x;_dist=player distance _x}} forEach allUnits;
						if (!isNull _nearest) then {
							moanstring=format ["<t align='left' size='1.2' color='#88ff5555'>Nearest survivor:<br/>%1<br/>%2 meters</t>",name _nearest,if (_dist<60) then {"Less than 60"} else {floor _dist}];
						} else {
							moanstring="";
						};

						{
							if (isNil {_x getVariable "zombie"}) then {
								_mkrName = format ["mkr%1",name _x];
								_mkr = createMarkerLocal [_mkrName,getPosATL _x];
								_mkrName setMarkerTypeLocal "mil_destroy";
								_mkrName setMarkerSizeLocal [0.5,0.5];
								_mkrName setMarkerColorLocal "ColorRed";
								_mkrName setMarkerAlphaLocal 1;
								[_mkrName] spawn {
									sleep 1;
									for "_i" from 0 to 50 do {
										(_this select 0) setMarkerAlphaLocal (1 - _i/50);
										sleep 0.1;
									};
									deleteMarkerLocal (_this select 0);
								};
							};
						} forEach playaBleUnits;

						player say3D _sound;
						CLY_z_noisepv=[player,_sound];
						publicVariable "CLY_z_noisepv";
						_moancooldown=time+([5,2.5,2,3,2.5,2.5,3,2.4,3,3,2.5,2,2,2,2,3] select ((CLY_noises_idle+CLY_noises_chase) find _sound));
					};
				};
				CLY_mouse1down=false;
				_canceljump=false;
			};
			_weapons=weapons player-["ItemRadio","ItemCompass","ItemWatch","ItemMap","ItemGPS"];
			_magazines=magazines player;
			if (count (_weapons+_magazines)>0) then {
				_nearest=player;
				{if (!alive _x and _x!=player and !(_x isKindOf "Animal") and _nearest==player) then {_nearest=_x}} forEach nearestObjects [player,["Man"],4];
				{player action ["DropWeapon",_nearest,_x]} forEach _weapons;
				{player action ["DropMagazine",_nearest,_x]} forEach _magazines;
			};
			sleep 0.05;
		};
	} else {
		if (alive player) then {
			if !(vehicle player in list CLY_location) then {
				if (_doom>=10) then {
					player setDamage 1;
					_victimsound=CLY_noises_scream select floor random count CLY_noises_scream;
					_object="HeliHEmpty" createVehicleLocal [0,0,0];
					_object attachTo [player,[0,0,1.5]];
					_object say3D _victimsound;
					_object spawn {sleep 5;deleteVehicle _this};
					[player,3] call CLY_z_claw;
					CLY_z_victimpv=[player,_victimsound,3];
					publicVariable "CLY_z_victimpv";
				} else {
					_doom=_doom+0.1;
					"colorCorrections" ppEffectAdjust [1-_doom*0.1,1-_doom*0.1,0,[0,0,0,0],[0.3,0.3,0.3,1.3],[1,1,1,0]];
					"colorCorrections" ppEffectCommit 0.1;
				};
			} else {
				if (_doom>0) then {
					"colorCorrections" ppEffectAdjust [1,1,0,[0,0,0,0],[0.3,0.3,0.3,1.3],[1,1,1,0]];
					"colorCorrections" ppEffectCommit 1;
					_doom=0;
				};
			};
		};
	};
	sleep 0.1;
};