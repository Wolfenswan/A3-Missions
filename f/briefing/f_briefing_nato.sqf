// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: BLUE

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
Made by Wolfenswan for Folk ARPS (folkarps.com)<br/>
Contact: wolfenswanarps@gmail.com
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

/*
// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
All FTLs and AARs carry one demo-charge each.
"]];
*/

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Locate the convoy and protect the caches.
"]];

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
CSAT need to either wipe out the NATO platoon or seize the caches.<br/>
NATO need to kill the CSAT attackers or seize the caches, then fall back 2.5km from the AO.<br/>
<br/><br/>
To claim the caches at least one unit of the respective must be within 10m of them for %1 minutes.<br/>
All four caches are next to the HEMTT truck. The crates and the truck can only be destroyed by demo charges.
",ws_param_time]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
A Mi-48 on morning patrol intercepted a FIA convoy, transporting weaponry we had given to the rebels. As we have lost contact with the intelligence officer accompanying the convoy we need to search around it's last known location or wait for him re-establish contact. To prevent any CSAT forces from seizing the NATO crates as evidence, we are deploying heliborn forces to support the FIA and - if necessary - blow up the cargo.
<br/><br/>
CSAT FORCES
<br/>
Motorized CSAT forces, possibly supported by heliborn troops from their <marker name='mkrCSAT'>base</marker>.
<br/><br/>
FIA FORCES
<br/>
FIA forces are probably defending their convoy.<br/>
Whether they are friendly to us or not is set by the host before the mission!
"]];

// ====================================================================================