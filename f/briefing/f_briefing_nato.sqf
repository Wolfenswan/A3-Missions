// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

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
All AARs and Lead Elements (CO,SLs,FTLs) have MRCO scopes.
"]];


// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin <marker name='mkrStart'>here</marker>.<br/>
2. Move into the <marker name='mkrAO'>AO</marker>, towards the <marker name='mkrAAF'>airfield</marker>.<br/>
3. Clear the <marker name='mkrAAF_2'>occupied town</marker> of any enemy presence.<br/>
4. Destroy any forces defending the barracks on and around the airfield.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
With the tensions between CSAT and NATO having reached a new high, our position towards the Altis Armed Forces (AAF) and their self-proclaimed neutrality has shifted. Recent intelligence reports suggest that they have been negotiating with CSAT to open Altis as a RnR area to them. <br/><br/>As a pre-emptive measure, NATO is launching an attack to seize and hold a beachhead. Your platoon has reached the south-eastern tip of the island by boats during the night and is now preparing to move out at early morning.
<br/><br/>
ENEMY FORCES
<br/>
Mostly AAF regulars, possibly supported by a few MRAP vehicles.<br/>
Few patrols in the countryside, but expect built-up areas to be more heavily defended.
<br/><br/>
FRIENDLY FORCES
<br/>
None.
"]];

// ====================================================================================