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

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
Team leaders and attachment assistens are equipped with Rangefinders.<br/>
All Rifleman AT carry HE rockets.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
FIRE SUPPORT
<br/>
CO can call in mortar strikes via the radio support menu (0-8).<br/>
Two mortars are available and both carry 32 HE shells as well as 18 smoke and flare shells each.<br/><br/>
PRIORITY TARGETS
<br/>
Any manpads and static AA in the area need to be destroyed.<br/>
If present disable or - if necessary - destroy the Mora IFV.<br/>
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We are inserted <marker name='mkrInsert'>here</marker>. Markers indicating the drops for each squad, attachments are with CO.<br/>
2. Proceed into the indicated AO, towards <marker name='mkrFIA'>Agios Konstantinos</marker>.<br/>
3. Eliminate the majority of the FIA forces and all high priority targets (see TASKS).<br/><br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA rebels have had a firm grip on the western part of Altis for too long. From <marker name='mkrFIA'>Agios Konstantinos</marker> they are easily able to conduct raids into our territory and use it as a base for their smuggling operations that are supplying the camps further land inwards. Dislodging them will be a crucial blow to their structure and the first step to regain control of our island. Our platoon is inserted by heli to the West, while mechanized elements are blocking the roads leading away to the east and north-east.
<br/><br/>
ENEMY FORCES
<br/>
The FIA are mostly irregulars with assault rifles, smgs and technicals. In a recent raid the FIA managed to obtain a working Mora IFV as well as an assortment of static weapons. It's very likely that they are used to defend the outpost.
<br/><br/>
FRIENDLY FORCES
<br/>
<marker name='mkrAAF'>Mechanized elements</marker> are preventing the FIA from fleeing towards Kavala.<br/><br/>
A mortar battery is on standby. See EXECUTION for details.
"]];

// ====================================================================================