_pos = [(getposASL player) select 0,(getposASL player) select 1,(getposATL player) select 2];
_dir = getDir player;
copyToClipboard format ["%1 - %2",_pos,_dir];
diag_log format ["ws_fnc DBG - POS: %1 DIR: %2",_pos,_dir];
["ws_fnc_copyPos: ",_pos," copied!"] call ws_fnc_debugtext;