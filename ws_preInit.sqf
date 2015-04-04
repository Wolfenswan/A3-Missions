
//Wolfenswan-modifications for A3
WS_zombieclasses = ["C_man_p_beggar_F","C_man_p_shorts_1_F_asia","C_man_p_fugitive_F_afro","C_man_p_beggar_F_afro"];
ws_playerMarkers = [];

//Locations
CLY_tinylocations=[MilTetos,Oreokastro,KastroHospital,Hotel_1,Factory];
CLY_smalllocations=[Lakka,MilTetos_1,Hotel,Edessa,Island,Frini];
CLY_mediumlocations=[Panochori,Neochori,Limni,Panagia];
CLY_largelocations=[Zaros];

CLY_locations = [];

CLY_lastSurvivor = "";


// WS - self-filling arrays
for "_i" from 0 to 49 do {
	CLY_locations set [_i,objNull];
};

for "_i" from 0 to (count CLY_tinylocations) do {
	CLY_locations set [_i,CLY_tinylocations select _i]
};

for "_i" from 0 to (count CLY_smalllocations) do {
	CLY_locations set [_i + 15,CLY_smalllocations select _i]
};

for "_i" from 0 to (count CLY_mediumlocations) do {
	CLY_locations set [_i + 29,CLY_mediumlocations select _i]
};

for "_i" from 0 to (count CLY_largelocations) do {
	CLY_locations set [_i + 44,CLY_largelocations select _i]
};


//Parameters
if (isNil "paramsArray") then {paramsArray=[0,0,0,-1,1200]};
CLY_timeofday=(paramsArray select 0);
CLY_weather=(paramsArray select 1);
CLY_fog=(paramsArray select 2)*0.01;
if (CLY_timeofday==0) then {CLY_timeofday=([1,2,3] select floor random 3)};
if (CLY_weather==0) then {CLY_weather=([1,2,3] select floor random 3)};
if (CLY_fog==0) then {CLY_fog=([30,60] select floor random 2)*0.01};

if (isServer) then {
	_temp=paramsArray select 3;
	_temp=switch _temp do {
		case -1:{(CLY_tinylocations+CLY_smalllocations+CLY_mediumlocations+CLY_largelocations) select floor random count (CLY_tinylocations+CLY_smalllocations+CLY_mediumlocations+CLY_largelocations)};
		case -2:{CLY_tinylocations select floor random count CLY_tinylocations};
		case -3:{CLY_smalllocations select floor random count CLY_smalllocations};
		case -4:{CLY_mediumlocations select floor random count CLY_mediumlocations};
		case -5:{CLY_largelocations select floor random count CLY_largelocations};
		default {(CLY_locations) select _temp};
	};

	border synchronizeObjectsAdd [_temp];
	CLY_Location = _temp;
	publicVariable "CLY_location";

	//Disable Lights
	{
		_lamps = (getPosATL CLY_LOcation) nearObjects [_x, (triggerArea CLY_Location select 0)];
		{
			_x setHit ["light_1_hitpoint", 0.97]; //off
		} forEach _lamps;
	} forEach ["Lamps_Base_F", "PowerLines_base_F", "Land_PowerPoleWooden_L_F", "Land_PowerPoleWooden_F", "Land_LampHarbour_F", "Land_LampShabby_F", "Land_PowerPoleWooden_L_F", "Land_PowerPoleWooden_small_F", "Land_LampDecor_F", "Land_LampHalogen_F", "Land_LampSolar_F", "Land_LampStreet_small_F", "Land_LampStreet_F", "Land_LampAirport_F","Land_LampHalogen_F"];
};
CLY_timelimit=paramsArray select 4;