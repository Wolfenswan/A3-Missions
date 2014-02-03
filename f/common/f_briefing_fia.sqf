// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: FIA

// ====================================================================================

// TASKS
// The code below creates tasks. A (commented-out) sample task is included.

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Made by Wolfenswan for Folk ARPS.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
2 x M2 Technicals were part of the convoy and their guns still operational.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Defend the crates at all costs.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin <marker name='fia_conv'>here</marker>.<br/>
2. We need to hold the area around the <marker name='fia_conv'>convoy</marker> and defend our caches.<br/>
3. CSAT forces will attack in full force, possibly supported by heliborn troops from their <marker name='mkrCSAT'>base</marker>.<br/>
4. NATO heliborn forces might be send from <marker name='mkrNATO'>their foothold</marker> to destroy the crates.<br/><br/>
NOTE<br/>
To seize the crates at least one CSAT unit must be within 10m of them for one full minute.<br/>
For NATO to be successful they need to either wipe out the CSAT platoon or destroy all four crates and the HEMTT and fall back at least 2.5k from the AO.<br/>
All four caches are next to the HEMTT truck. The crates and the truck can only be destroyed by demo charges.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
A Mi-48 on morning patrol intercepted one of our <marker name='fia_conv'>convoys</marker>. It seems they noticed the 'goods' we were carrying, as instead of annhilating us they just disabled the vehicles. We need to defend the NATO weapons we were transporting from any infantry they might send.
<br/><br/>
ENEMY FORCES
<br/>
Motorized CSAT forces, possibly supported by heliborn troops from their <marker name='mkrCSAT'>base</marker>.
<br/><br/>
FRIENDLY FORCES
<br/>
Our NATO friends might be sent by heli.<br/><br/>
NOTE<br/>
This can be played as a three-way adversarial where FIA have to defend the caches at all costs while NATO wants nothing but to destroy them.
"]];

// ====================================================================================