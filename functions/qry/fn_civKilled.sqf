_killed = _this select 0;
_killer = _this select 1;

alivePlayerList = alivePlayerList - [_killed];

// Calculate
if (hasInterface) then {
	//_myTarget = player getVariable["qry_target",objNull];
	if (player == _killer) then {
		if (_killed in myTargetList) then {
			qry_hp = qry_hp + quarry_player_kill_time_reward; //player setVariable["qry_hp",(player getVariable["qry_hp",60*10])+(3*60)];
            player setVariable["qry_hp",qry_hp,true];
			systemChat "You killed your quarry. You have received an extra 3 minutes on your clock.";
		} else {
          //killed someone that wasn't my _killed.
            _hasWeapon = (currentWeapon _killed != "");
            _hadWeapon = (((_killed getVariable ["qry_hadWeapon",(-30)])+5) > time);
            _wasSpeeding = (((_killed getVariable["qry_lastSpeeding",(-30)])+6) > time);
            if (side _killer == civilian) then {
                if (side _killed == civilian) then {
                    // was a civilan
                    if (_killed getVariable["qry_target",objNull] == player) then {
                        systemChat format["You killed %1 and you were their quarry.",name _killed];
                    } else {
                        if (_hasWeapon or _hadWeapon or _wasSpeeding) then {
                            systemChat format["You killed %1 and you were NOT their quarry but you will recieve no penalty.",name _killed];
                        } else {
                            systemChat format["You killed %1 and you were NOT their quarry you will lose 2 minutes of lifetime.",name _killed];
                            qry_hp = qry_hp - 120;
                            player setVariable["qry_hp",qry_hp,true];
                        };

                    };
                };
            } else {
                if (side _killed == civilian) then {
                  //Cop killed civilian
                    if (_hasWeapon or _hadWeapon or _wasSpeeding) then {
                        systemChat format["You killed %1 and it seems they were indeed a threat.",name _killed];
                    } else {
                        systemChat format["You killed %1 but it seems they weren't a threat. You must file some paperwork at the station to get your primary weapon back.",name _killed];
                        player setVariable["qry_paperWork",true];
                        player removeWeapon 'SMG_02_F';
                    };
                };

            };
        };
	} else {
		if (player == _killed) then {
			if (side _killer == west) then {
				systemChat format["You were killed by police officer %1.",name _killer];
			} else {
				if (_killer getVariable["qry_target",objNull] == player) then {
					systemChat format["You were killed by %1 and you were their quarry.",name _killer];
				} else {
					systemChat format["You were killed by %1 and you were not their quarry.",name _killer];
				};
			};
		};
	};
    if (player == _killed) then {
        qry_hp = -1;
    };
};