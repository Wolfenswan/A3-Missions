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
<marker name='mkrVeh'>Ground-Transport:</marker><br/>
2 x Zamak<br/>
1 x Strider (unarmed)<br/>
1 x Strider (HMG)<br/><br/>
<marker name='mkrVeh_1'>Helicopters:</marker><br/>
1 x Mohawk (carries 16)<br/>
2 x Hellcat (w. HMG - carries 6)<br/>
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
FIA wins if both officers conduct their meeting and escape to 2.5km distance from the town.<br/>
AAF wins if both officers are taken out or they flee before the meeting has taken place.
",ws_param_meeting]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Two high-ranking FIA officers are about to meet in a town nearby. Our officers are growing weary of being insulted as useless sons of dogs and are sending us out to deal with this insolence. We are tasked to intercept the meeting and take out the officers before they can escape.
<br/><br/>
ENEMY FORCES
<br/>
Lightly armed infantry and technicals.<br/>
They might be equipped with RPG32-HE, so avoid clustering.
<br/><br/>
ROE<br/>
If the Abibala is armed, it is suggested that a 'no explosives in built up areas' ROE is enforced. An expection could be made for the drone, which is allowed to only strike the building where the officers are known to be in to avoid collateral damage (you know, just like in real life).<br/><br/>"]];

// ====================================================================================