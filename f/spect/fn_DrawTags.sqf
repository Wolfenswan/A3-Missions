// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
// draw tags
if(!f_cam_toggleTags || f_cam_mapMode == 2 ) exitWith{};
{
    
	_color = switch (side _x) do {
	    case blufor: {f_cam_blufor_color};
	    case opfor: {f_cam_opfor_color};
	    case independent: {f_cam_indep_color};
	    case civilian: {[1,1,1,1]};//f_cam_civ_color};
	    default {f_cam_empty_color};
	};

	{
        _distToCam = (call f_cam_GetCurrentCam) distanceSqr _x;
		if(_distToCam < (220*220)) then
            {
            if(vehicle _x == _x && alive _x || vehicle _x != _x && (crew vehicle _x) select 0 == _x && alive _x) then
            {
                _visPos = getPosATLVisual _x;
                if(surfaceIsWater _visPos) then  {_visPos = getPosASLVisual _x;};
                _color set [3,0.8];
                _str = "";
                _icon = "\A3\ui_f\data\map\markers\military\dot_CA.paa";
                if (_distToCam < (100*100)) then {
                    if (side _x == civilian) then {
                        if (_distToCam < (8*8)) then {
                            _str = format["%1 (their target %2), Life left: %3 Mins",name _x,name (_x getVariable["qry_target",objNull]),ceil(_x getVariable["qry_hp",quarry_player_life_time_start])/60];
                        } else {
                            if (_distToCam < (12*12)) then {
                                _str = format["%1 (their target %2)",name _x,name (_x getVariable["qry_target",objNull])];
                            } else {
                                _str = format["%1",name _x];
                            };
                        };
                    } else {
                        _str = name _x;
                    };
                };
                _fontSize = 0.1;
                if (_distToCam > 0) then {
                    _fontSize = 2/_distToCam;
                };
                _fontSize = _fontSize max 0.02;
                _fontSize = _fontSize min 0.07;
                
                
                drawIcon3D [_icon, _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +2.5], 0.7, 0.7, 0,_str, 2, _fontSize]; // textSize = 1.5
            };
        };
	} foreach units _x;


} forEach allGroups;