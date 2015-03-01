// Translate position, position given an angle and distance.

// [] execVM "vehicleCreate.sqf";

vehicle_classes = ["C_Hatchback_01_sport_F","C_Hatchback_01_F","C_SUV_01_F","C_Van_01_box_F","C_Quadbike_01_F"];
//vehicle_classes = vehicle_classes + ["RDS_Golf4_Civ_01","LandRover_TK_CIV_EP1"]; // mods
num_of_vehicles_toSpawn = 10; // 36
vehicle_spawner_debug = false;
vehicle_min_roadSegement_spacing = 3; //8

fn_trans_pos = {
	_pos = _this select 0;
	_length = _this select 1;
	_angle = _this select 2;

    _pos2 = [0,0,0];
	_pos2 set [1,(_pos select 1) + (cos(_angle)*_length)];
	_pos2 set [0,(_pos select 0) + (sin(_angle)*_length)];
    _pos2 set [2,(_pos select 2)];
	_pos2
};

fn_findRoadConnections = {
  private["_road","_depth"];

  _road = _this select 0;
  _depth = _this select 1;
  _return = [_road];
  if (_depth > 0) then {
      {
        _return = _return + ([_x,_depth-1] call fn_findRoadConnections);
      } forEach (roadsConnectedTo _road);
  };
  _return
};



markerCount = 0;
fn_findRoadConnectionsMark = {
    private["_road","_depth","_parent"];
    _road = _this select 0;
    if (count (_this) > 2) then {
        _parent = _this select 2;
    } else {
      _parent = objNull;
    };
    _depth = _this select 1;
    //_return = [_road];
    private["_childSegments"];
    _childSegments = (roadsConnectedTo _road);

    _txt=format["roadM_Mkr%1",markerCount];
    _debugMkr=createMarker [_txt,getPos _road];
    _debugMkr setMarkerShape "ICON";
    _debugMkr setMarkerType "hd_dot";
    _debugMkr setMarkerText format ["%1",count _childSegments];
    switch (count _childSegments) do {
      case 0: { _debugMkr setMarkerColor "ColorBlue";};
        case 1: {_debugMkr setMarkerColor "ColorRed";};
        case 2: {_debugMkr setMarkerColor "ColorGreen";};
        case 3: {_debugMkr setMarkerColor "ColorYellow";};
        case 4: {_debugMkr setMarkerColor "ColorOrange";};
        case 5: {_debugMkr setMarkerColor "ColorPink";};
        case 6: {_debugMkr setMarkerColor "ColorWhite";};
        case 7: {_debugMkr setMarkerColor "ColorBrown";};
        default {};
    };
    markerCount = markerCount + 1;
  if (_depth > 0) then {
      _childSegments = _childSegments - [_parent];
      {

          [_x,_depth-1,_road] call fn_findRoadConnectionsMark;
      } forEach (_childSegments);
  };


 // _return
};


fn_isNearInterection = {
    //Primary logic intersection either has 1 or 2+ connections.
    private["_road","_roadConnectTo"];
    _road = _this select 0;
    _roadConnectedTo = roadsConnectedTo _road;
    _return = false;
    if ((count _roadConnectedTo != 2)) then {
        _return = true;
    } else {
        {
            if (count (roadsConnectedTo _x) != 2) exitWith { _return = true};
        } forEach (_roadConnectedTo);
    };
    _return
};


//sort the array of positions still to use by some distance sort? then use (random 1)^2 ? to lower probability of the higher distanced ones?

_size = getMarkerSize "spawnArea";
_size = (_size select 0) max (_size select 1);
_roadPosArray = (getMarkerPos "spawnArea") nearRoads _size;
_roadPosArray= _roadPosArray call BIS_fnc_arrayShuffle;


_mkrCount = 0;
_direction2 = 0;
for "_i" from 0 to num_of_vehicles_toSpawn-1 do {
    if (_i > count (_roadPosArray)-2) exitWith {hint "Not enough positions to spawn desired number of vehicles";};
    _road = (_roadPosArray select 0);
	_roadConnectedTo = roadsConnectedTo _road;
    //[_roadPosArray select 0,3] call fn_findRoadConnectionsMark;
    if ([_road] call fn_isNearInterection) then {
        _roadPosArray deleteAt 0;
        _i = _i - 1;
    } else {
        _connectedRoad = _roadConnectedTo select 0;
        _roadPos = getPos _road;
        _direction = [_roadPos, _connectedRoad] call BIS_fnc_DirTo;
        _vehicle = vehicle_classes call BIS_fnc_selectRandom;
        _newPos = _roadPos;
        _continue = true;

        //test either side of the road for more space.
        _direction2 = _direction + 90;
        _tempPos = [_newPos,0.5,_direction2] call fn_trans_pos;
        _kCount = 1;
        for "_k" from 1 to 15 do {
            _tempPos = [_newPos,0.5,_direction2] call fn_trans_pos;
            if (count (_tempPos findEmptyPosition [0, 0]) == 0) exitWith {}; // ,_vehicle
            if (vehicle_spawner_debug) then {
                _txt=format["roadMkr%1",_mkrCount];
                _debugMkr=createMarker [_txt,_tempPos];
                _debugMkr setMarkerShape "ICON";
                _debugMkr setMarkerType "hd_dot";
                _debugMkr setMarkerColor "ColorBlue";
                _mkrCount = _mkrCount + 1;
            };
            //if (count ((_tempPos) isFlatEmpty [ (sizeOf _vehicle) /2 , 0, 1000, (sizeOf _vehicle),  0, false, _x ]) == 0) exitWith {};
            _newPos = _tempPos;
            _kCount = _kCount + 1;
        };
        _jPos = _newPos;
        _newPos = _roadPos;
        _direction2 = _direction - 90;
        _j = 1;
        _jCount = 1;
        for "_j" from 1 to 15 do {
            _tempPos = [_newPos,0.5,_direction2] call fn_trans_pos;
            if (count (_tempPos findEmptyPosition [0, 0]) == 0) exitWith {}; // ,_vehicle
            if (vehicle_spawner_debug) then {
                _txt=format["roadMkr%1",_mkrCount];
                _debugMkr=createMarker [_txt,_tempPos];
                _debugMkr setMarkerShape "ICON";
                _debugMkr setMarkerType "hd_dot";
                _debugMkr setMarkerColor "ColorGreen";
                _mkrCount = _mkrCount + 1;
            };
            //if (count ((_tempPos) isFlatEmpty [ (sizeOf _vehicle) /2 , 0, 1000, (sizeOf _vehicle),  0, false, _x ]) == 0) exitWith {};
            _newPos = _tempPos;
            _jCount = _jCount + 1;
        };

        if (_jCount==1 and _kCount == 1) then {
            _direction2 = _direction + 90;
            _newPos = [_newPos,2,_direction2] call fn_trans_pos;
        } else {
            if (_kCount > _jCount) then {
              //_newPos = _jPos;
                _direction2 = _direction + 90;
                _newPos = [_roadPos,(_kCount-4)*0.5,_direction2] call fn_trans_pos;
            } else {
                _newPos = [_roadPos,(_jCount-4)*0.5,_direction2] call fn_trans_pos;
            };
        };


       // if (random 10 > 9) then {
        _veh = _vehicle createVehicle _newPos;
        _veh setDir _direction;
        [_veh] spawn qry_fnc_civCar;

        if (vehicle_spawner_debug) then {
            _txt=format["roadMkr%1",_mkrCount];
            _debugMkr=createMarker [_txt,_newPos];
            _debugMkr setMarkerShape "ICON";
            _debugMkr setMarkerType "hd_dot";
             _debugMkr setMarkerText format ["%1",count _roadConnectedTo];
            _mkrCount = _mkrCount + 1;
            (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format["(_this select 0) drawLine [[%1,%2,%3], [%4,%5,%6],[0,0,1,1]];",_roadPos select 0,_roadPos select 1,_roadPos select 2,_newPos select 0, _newPos select 1, _newPos select 2]];
        };

        _closeROADS = ([_road,vehicle_min_roadSegement_spacing] call fn_findRoadConnections);
        _roadPosArray = _roadPosArray - _closeROADS;
    };

};