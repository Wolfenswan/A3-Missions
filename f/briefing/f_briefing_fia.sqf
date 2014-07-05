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
2 x Offroads (one for each officer)<br/>
2 x Offroads (armed - accompanying each officer)<br/>
Drive carefully - we don't have any spare tires<br/><br/>
Several civilian vehicles can be found in the town.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin <marker name='mkrTown'>here</marker>.<br/>
2. Protect the officers while they conduct their <marker name='meeting'>meeting</marker>.<br/>
3. Repell any assaults by the <marker name='mkrAAF'>AAF</marker> and provide safe escort for the officers away from the AO.<br/><br/>
OFFICER MEETING<br/>
The starting locations of the officers are randomized and their distance can benefit either of the two sides.<br/>
The meeting takes place at a randomized location. For the meeting to conduct, the two officers have to stay within the indicated circle for 10 consecutive minutes.<br/><br/>
VICTORY CONDITIONS<br/>
FIA wins if both officers conduct their meeting and escape to 2.5km distance from the town.<br/>
AAF wins if both officers are taken out or they flee before the meeting has taken place.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Two of our high-ranking FIA officers are about to hold an important meeting in a <marker name='mkrTown'>nearby town</marker>. While the AAF has been dormant for a while, we are sure the dicator's lapdogs will try and take out our leaders. We must not let this happen.
<br/><br/>
ENEMY FORCES
<br/>
AAF regulars, both motorized and airborn. They will possibly use UAVs against us.
<br/><br/>

ROE<br/>
If the Abibala is armed, it is suggested that a 'no explosives in built up areas' ROE is enforced. An expection could be made for the drone, which is allowed to only strike the building where the officers are known to be in (just like in real life).<br/><br/>
"]];

// ====================================================================================