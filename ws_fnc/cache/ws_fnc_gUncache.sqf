 {
if(_x != leader _this && !("Driver" in assignedVehicleRole _x)) then {

                if (vehicle _x == _x) then {

                                        // Workaround for ws_taskDefend:
                                        // Sometimes units moved by taskDefend get assigned formationPosition z-level -100 after caching. This makes sure they get put back into their spot
                                        _pos = _x getVariable ["ws_bpos",formationPosition _x];

                                        // To be sure: If z-position is still underground, set it to 0.
                                        if (_pos select 2 < 5) then {_pos set [2,0]};

                                        player globalchat format ["%1:%2",_x,_pos];

                                        _x setPos _pos;
                };
                                _x allowDamage true;
                                _x enableSimulation true;

                                _x enableAI "TARGET";
                                _x enableAI "AUTOTARGET";
                                _x enableAI "MOVE";
                                _x enableAI "ANIM";
                                _x enableAI "FSM";
                };
} forEach units _this;

true