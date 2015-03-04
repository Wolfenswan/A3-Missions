/* ws_fnc_tripFlare

FEATURE
Creates illuminated smoke at position

USAGE
[position,color] spawn ws_fnc_tripFlare

PARAMETERS
1. position  at which to spawn the flare | MANDATORY - object, array [x,y,z] or marker
2. color of the smoke					 | MANDATORY - "red", "green","yellow" or "white"

*/

private ["_color","_chm","_smk","_duration"];

_pos = (_this select 0) call ws_fnc_getEpos;
_color = toLower(_this select 1);
_duration = if (count _this > 2) then {_this select 2} else {0};

_time = diag_tickTime;

if !(_color in ["green","red","yellow","white"]) exitWith {["ws_fnc_tripFlare DBG: ",[_color]," is not one of: [""green"",red","yellow","white""]"] call ws_fnc_debugtext};

_chm = (format ["F_40mm%1","_"+_color]) createVehicle _pos;
sleep 0.5;
if (_color == "white") then {_color =""};
_smk = (format ["Smokeshell%1",_color]) createVehicle _pos;
_smk setVectorUp [1,0,0];


while {!isNull _smk} do {
	sleep 21.5; // A flare takes roughly 25seconds to die off
	if (!isNull _smk) then {
		_chm = (format ["F_40mm%1","_"+_color]) createVehicle _pos;
	};
	sleep 0.01;
};