ws_isHC = [] call ws_fnc_checkHC;

// On neither the server nor the HC
if (!isDedicated && !ws_isHC) then {

	// Display a short text intro
 	[] spawn {
	 waitUntil {time > 15};
		["THE STING","NEAR PYRGOS"] call ws_fnc_showIntro;
	};
};

if (isNIl "ws_param_hc") then {ws_param_hc = "ws_param_hc" call BIS_fnc_getParamValue;};

_pcars = [pcar] call ws_fnc_collectObjectsNum;
{
	_x addAction ["Beacons On",{(_this select 0) animate ["BeaconsStart",1]},[],50,false,true,"","_target animationPhase 'BeaconsStart' < 0.5 AND Alive(_target) AND driver _target == _this"];
	_x addAction ["Beacons Off",{(_this select 0) animate ["BeaconsStart",0]},[],51,false,true,"","_target animationPhase 'BeaconsStart' > 0.5 AND Alive(_target) AND driver _target == _this"];
	_veh = _x; {_veh setObjectTexture [_x,'#(argb,8,8,3)color(0.03,0.03,0.03,0.5)'];} forEach [0,1,2];
	_x animate["hidePolice",0];
	_x animate["hideBumper1",1];
	_x animate["hideBumper2",0];
	_X animate ["BeaconsStart",1];
} forEach _pcars;


// Do more stuff exclusively on the server
if (isServer) then {

};