// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: FIA

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
Made by Wolfenswan for Folk ARPS.<br/>
wolfenswanarps@gmail.com
<br/><br/>
Uses Norrin's convoy script<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
MOVEMENT PLAN
<br/>
Stay within the indicated AO (highlighted area) while on approach to the killzone.
<br/><br/>
LAYING LOW
<br/>
After you have been notified about the killzone being clear, the leading elements (CO,DC,SLs) can use their radio to wait for the ambush (0-0-1).<br/>
Time will skip forward to about 3:10 at night.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin <marker name='mkrFIA'>here</marker>.<br/>
2. Clear the <marker name='mkrKillzone'>killzone</marker> of enemy presence.<br/>
3. Await the arrival of the night (See: EXECUTION for details).<br/>
4. Ambush the convoy and destroy 3/4 of it.<br/>
5. Fall back to the <marker name='mkrFIA_1'>extract location</marker>.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Word has slipped that CSAT are planning to transport an important device of unknown purpose into Kavala during the cover of the night. Embedded CTRG forces and FIA guerillas are planning to intercept and destroy it. Unfortunately a platoon of AAF conscripts has made camp at the <marker name='mkrKillzone'>designated killzone</marker> and needs to be cleared out first.
<br/><br/>
ENEMY FORCES
<br/>
A AAF platoon has taken position at the killzone. We won't need to worry about them alarming CSAT - lower-level communication between the two sides has been lackluster at best.<br/><br/>
Composition of the CSAT convoy is unknown but expect armored vehicles. They tend to do helicopter passes before moving a convoy in, so be careful.
<br/><br/>
"]];

// ====================================================================================