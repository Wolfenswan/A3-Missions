/*
	CLY Jukebox by Celery
	
	This script will let you play several music tracks in succession.
	Loading a savegame or visiting the ESC menu will not disrupt the music.
	
	Requires
	onPauseScript="cly_jukebox.sqf";
	in description.ext.
	
	Execute anywhere when needed with the required arguments.
	
	Example:
	0=[0,["EP1_Track08",63,134,1],["EP1_Track14",0,255,0.8]] execVM "cly_jukebox.sqf"
	Arguments:
	[loop,["track name",start mark,end mark,volume],[...]]
	Loop: <0: no loop  1: loop  2: play random tracks indefinitely>
	
	You can stop the script with CLY_jukeboxkill=<fade out in seconds>
	CLY_jukeboxkill=5 will fade the music to zero in 5 seconds and the script ends.
	
	You can pause the script with CLY_jukeboxpause=true and unpause with false.
*/

//Resume track at correct mark after ESC or load
if (typeName (_this select 0)=="DISPLAY") exitWith {CLY_jukeboxresume=true};
if (isNil "CLY_jukeboxresumescript") then {
	CLY_jukeboxresumescript=[] spawn {
		while {true} do {
			_loadcheck=[] spawn {disableSerialization;waitUntil {false}};
			waitUntil {scriptDone _loadcheck};
			CLY_jukeboxresume=true;
		};
	};
};

_loop=_this select 0;
_tracks=[];
{if (typeName _x=="ARRAY") then {_tracks=_tracks+[_x]}} forEach _this;
if (count _tracks==0) exitWith {hint "No tracks recognized by CLY Jukebox!"};

_i=-1;
_track="";
_lasttrack="";
_volume=1;
_fadein=0;
_fadeout=0.3;
_trackstart=0;
_trackstarts=0;
_trackend=0;
_trackends=-1;
_duration=_trackend-_trackstart;
_resumedata=["",0];

//ID number of the script: prevents two scripts from running in parallel
if (!isNil "CLY_jukeboxid") then {CLY_jukeboxid=CLY_jukeboxid+1};
if (isNil "CLY_jukeboxid") then {CLY_jukeboxid=0};
_jukeboxid=CLY_jukeboxid;

//Kill switch: set to 0 or more and the jukebox will fade out in that many seconds
CLY_jukeboxkill=-1;

//Pause flag
CLY_jukeboxpause=false;

//Resume flag: will be true and makes music resume correctly when game is paused or loaded
CLY_jukeboxresume=false;

scopeName "main";
while {CLY_jukeboxkill<0 and CLY_jukeboxid==_jukeboxid and (_loop>0 or _i<count _tracks)} do {
	if (time>_trackends) then {
		_i=_i+1;
		if (_i>=count _tracks) then {
			if (_loop==0) then {CLY_jukeboxkill=1;breakTo "main"} else {_i=0};
		};
		
		_trackdata=[];
		if (_loop!=2) then {
			_trackdata=_tracks select _i;
		} else {
			_trackdata=_tracks select floor random count _tracks;
			while {_loop==2 and count _tracks>1 and _trackdata select 0==_lasttrack} do {
				_trackdata=_tracks select floor random count _tracks;
			};
		};
		_track=_trackdata select 0;
		_trackstart=_trackdata select 1;
		_trackend=_trackdata select 2;
		_volume=_trackdata select 3;
		_duration=_trackend-_trackstart;
		_fadein=if (_trackstart>0) then {0.2} else {0};
		
		_fadeout fadeMusic 0;
		sleep _fadeout;
		_fadeout=1;
		
		if (CLY_jukeboxkill>=0 or CLY_jukeboxid!=_jukeboxid) then {breakTo "main"};
		
		_fadein fadeMusic _volume;
		playMusic [_track,_trackstart];
		
		_lasttrack=_track;
		_trackstarts=time;
		_trackends=time+_trackend-_trackstart;
	};
	
	_resumedata=[_track,time-_trackstarts+_trackstart];
	
	if (CLY_jukeboxresume) then {
		playMusic _resumedata;
		CLY_jukeboxresume=false;
	};
	
	if (CLY_jukeboxpause) then {
		1 fadeMusic 0;
		sleep 1;
		waitUntil {!CLY_jukeboxpause};
		if (CLY_jukeboxkill<0 and CLY_jukeboxid==_jukeboxid) then {
			1 fadeMusic _volume;
			playMusic _resumedata;
		} else {
			breakTo "main";
		};
	};
	
	sleep 0.05;
};

if (CLY_jukeboxkill>=0) then {CLY_jukeboxkill fadeMusic 0};