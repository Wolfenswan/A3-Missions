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
Inspired by the original Warlords for Arma2 by Housemaster.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================


// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
2 x Taru - open bench (takes 10 with Co-Pilot & Loadmaster)<br/>
1 x Orca - Gatling (takes 8)<br/><br/>
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format["
<br/>
1. We begin <marker name='mkrAAF'>here</marker>.<br/>
2. Proceed towards the <marker name='mkrTown'>target town</marker> and locate the meeting place of the officers. Strike swiftly to take them out.<br/><br/>
OFFICER MEETING<br/>
The starting locations of the officers are randomized and their distance to the town can benefit either of the two sides.<br/>
The meeting takes place at a randomized location. For the meeting to conduct, the two officers have to stay within the indicated circle for %1 consecutive minutes.<br/><br/>
VICTORY CONDITIONS<br/>
FIA wins if both officers conduct their meeting and at least one escapes the vicinity of the town (leave highlighted area).<br/>
CSAT wins if both officers are taken out or the officers flee before the meeting has taken place.
",ws_param_meeting]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Two high-ranking FIA officers are about to meet in a town nearby. Our own officers are growing weary of being insulted as useless sons of dogs and are sending us out to deal with this insolence. We are tasked to intercept the meeting and take out the FIA leaders before they can escape. Time is of the essence!
<br/><br/>
ENEMY FORCES
<br/>
The usual rabble. The protection details of the officers are most likely better equipped and trained than the local cell.<br/>"]];

// ====================================================================================