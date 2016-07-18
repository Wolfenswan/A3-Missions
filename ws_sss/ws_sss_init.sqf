/* WOLFENSWAN's SIMPLE SPAWN SYSTEM */

// Check if client is a headless client
ws_var_isHC = [] call ws_fnc_checkHC;

// Scope - Server only by default
if !(isServer) exitWith {};

// Include all relevant files
#include "ws_sss_functions.sqf"
#include "ws_sss_processlogics.sqf"
#include "ws_sss_spawn.sqf"

// Code to be executed after spawning:

// Check if F3 AI Skill Selector is active and process the new units
if({!isNil _x} count ["f_param_AISkill_BLUFOR","f_param_AISkill_INDP","f_param_AISkill_OPFOR"] > 0) then {
    [] execVM "f\setAISKill\f_setAISkill.sqf";
};