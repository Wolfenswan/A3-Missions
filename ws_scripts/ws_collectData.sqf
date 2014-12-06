[
	_this call
	{
		(_this select 0) removeAction (_this select 2);

		if (isServer) then {
			deleteVehicle (_this select 0);
			deleteMarker "mkrLaptop";
			(_this select 1) addItem "B_UavTerminal";
		};

		[["DataCollected",[format ["%1",name (_this select 1)]]],"bis_fnc_showNotification",true] spawn BIS_fnc_MP;
		// TODO Set completed task?

		ws_dataCollected = true; publicVariable "ws_dataCollected";
	}
,"BIS_fnc_spawn",true] spawn BIS_fnc_MP; // NOTE: change true to specific side for adversarial