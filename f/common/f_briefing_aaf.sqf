// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: AAF

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

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. Hold the <marker name='mkrAO'>facility</marker>. If for 10 seconds no AAF unit should be present while CSAT are inside, CSAT will have seized it.<br/>
2. We can use the <marker name='mkrTown'>town</marker> to our advantage.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Advancing CSAT forces are threatening one of our <marker name='mkrAO'>storage facilities</marker>. We need to repell them.
<br/><br/>
ENEMY FORCES
<br/>
Not more than a platoon worth of infantry, possibly support by a light vehicle.
<br/><br/>
FRIENDLY FORCES
<br/>
None.
"]];

// ====================================================================================