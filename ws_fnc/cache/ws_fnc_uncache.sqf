 {
if(_x != leader _this && !("Driver" in assignedVehicleRole _x)) then {

                if (vehicle _x == _x) then {
                                        _x setPosATL (formationPosition _x);
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