// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: BLUE

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Made by Wolfenswan for Folk ARPS (folkarps.com)<br/>
Contact: wolfenswanarps@gmail.com
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================


// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
As transport helicopters we have either a Huron or a Ghosthawk available. The scout helicopter can carry four people.
"]];


// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

/*
_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Locate the convoy and secure th.
"]];
*/

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format ["
<br/>
1. We begin <marker name='mkrNATO'>here</marker>.<br/>
2. We need to locate the convoy.<br/>
3. Deploy our forces and move in to secure the caches, then extract.<br/>
4. CSAT motorized  They will probably try and seize the caches, don't let this happen.<br/><br/>
VICTORY CONDITIONS<br/>
CSAT need to either wipe out 90% of the NATO platoon or secure the HEMTT.<br/>
NATO need to kill 90% of the CSAT attackers or rig the HEMTT to explode, then fall back 2.5km from the AO.<br/>
<br/><br/>
To claim the cargo at least one unit of the respective side must be within a 10m radius of the HEMTT for %1 (CSAT) or %2 (NATO) minutes.<br/>
",ws_param_time_o,ws_param_time_n]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
A Mi-48 on morning patrol intercepted a FIA convoy, transporting weaponry we had given to the rebels. As we have lost contact with the intelligence officer accompanying the convoy we need to search around it's last known location or wait for him re-establish contact. Thus your platoon is to deploy and rig the cargo to explode. We can deal with the consequences of a minor confrontation but CSAT musn't be allowed to secure the HEMTT. If CSAT would be able to secure the cargo and increment the NATO peacekeeping forces on Altis we would face nothing short of an international political fallout.
<br/><br/>
CSAT FORCES
<br/>
Motorized CSAT forces.
<br/><br/>
FIA FORCES
<br/>
FIA forces are probably defending their convoy.<br/>
Whether they are friendly to us or not is set by the host before the mission!
"]];

// ====================================================================================