// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CSAT

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
Up to:<br/>
1 x Ifrit - unarmed<br/>
2 x Ifrit - HMG (no thermal sights)<br/>
2 x Tempest Transports (loaded with Alpha and Bravo respectively)<br/>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Eliminate FIA forces and secure the cargo.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format ["
<br/>
1. We begin a few k away from the <marker name='fia_conv'>convoy</marker>.<br/>
2. We need to reach the <marker name='fia_conv'>convoy</marker> and destroy the caches.<br/>
3. FIA forces at the convoy will most likely offer resistance. Use all force necessary.<br/>
4. NATO heliborn forces might be send from <marker name='mkrNATO'>their airfield</marker>. Deal with them as the need arises.<br/><br/>
VICTORY CONDITIONS<br/>
CSAT need to either wipe out the NATO platoon or secure the HEMTT.<br/>
NATO need to kill the CSAT attackers or rig the HEMTT to explode, then fall back 2.5km from the AO.<br/>
<br/><br/>
To claim the cargo at least one unit of the respective side must be within a 10m radius of the HEMTT for %1 (CSAT) or %2 (NATO) minutes.<br/>
",ws_param_time_o,ws_param_time_n]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
A Mi-48 on morning patrol intercepted a <marker name='fia_conv'>FIA convoy</marker>. Before engaging the gunner noticed unusual activity around one of the vehicles.
As intelligence has been suspecting that local MATO forces have been supplying FIA to undermine our operations, we are going to send your platoon to investigate. Mob up the FIA survivors and seize all cargo evidence.
<br/><br/>
ENEMY FORCES
<br/>
Light FIA forces, some of the M2 technicals accompanying the convoy might still be operational.<br/>
If our suspicion is true, NATO heliborn forces might be deployed to remove all evidence.
<br/><br/>
FRIENDLY FORCES
<br/>
None.<br/><br/>
TELEPORT<br/>
At the beginning of the mission the all CSAT group-leaders can use their 'Teleport'-action to move their team into position, outside the red circle. Transport-vehicles (see ADMINISTRATION) will be placed at nearby road positions of the spot the CSAT CO choses for his teleport. The MRAP and APC crews needs to stay inside their vehicles.
"]];

// ====================================================================================
