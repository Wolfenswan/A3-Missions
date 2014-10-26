// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: AAF

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
Thanks to {C9}Jester for his smoke column script.<br/>
Credits to Shuko for his ARMA2 mission Jolly Green.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
We start in:<br/>
CO/MMG1 - Strider (unarmed)<br/>
Alpha/Bravo/Charlie - Zamak (one each)<br/>

"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin near the <marker name='mkrWreckCircle2'>estimated crash site</marker>.<br/>
2. Move in and kill all survivors, first and foremost the colonel.<br/>
3. Transfer the data from the wreck and move away from the AO.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
During the night unknown forces managed to free one of our colonels, who was under lockdown for assumed FIA-sympathies. They made it to their extraction helicopter but went down shortly after. We need to mop up any surviving forces and recover the helicopters flight computer, to get proof on who was behind this.
<br/><br/>
ENEMY FORCES
<br/>
If our suspicions are true, NATO forces will most likely be deployed to remove all  traces of evidence.
"]];

// ====================================================================================