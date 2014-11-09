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
Our weapons have inferior range to the AAF guns, so avoid any long-range engagements.<br/>
All RPG missiles are HE variants.<br/><br/>
Ground-Transport:<br/>
2 x Offroads (armed - one for each officer)<br/>
Drive carefully - we don't have any spare tires<br/><br/>
Several civilian vehicles can be found in the town.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format["
<br/>
1. We begin <marker name='mkrTown'>here</marker>.<br/>
2. Protect the officers while they conduct their <marker name='meeting'>meeting</marker>.<br/>
3. Repell any assaults by the <marker name='mkrAAF'>AAF</marker> and provide safe escort for the officers away from the AO.<br/><br/>
OFFICER MEETING<br/>
The starting locations of the officers are randomized and their distance can benefit either of the two sides.<br/>
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
Two of our leaders are about to hold an important meeting in a <marker name='mkrTown'>nearby town</marker>. While the CSAT has been dormant for a while, we are sure the imperialist pigs will try and take out our beloved comrades. We must not let this happen.
<br/><br/>
ENEMY FORCES
<br/>
CSAT regulars, airborn.
<br/><br/>
"]];

// ====================================================================================