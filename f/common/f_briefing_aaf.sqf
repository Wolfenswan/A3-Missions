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
*** Insert information on administration and logistics here. ***
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/
FIRE SUPPORT PLAN
<br/>
CO can call in mortar strikes via the radio support menu (0-8).<br/>
As soon as AA has been taken out Wildcat-CAS and a supply drop will be available.
<br/><br/>
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
2. Proceed into the indicated AO, towards <marker name='mkrFIA'>TOWNNAME</marker>.<br/>
3. Eliminate the majority of the FIA forces and all high priority targets (see EXECUTION).<br/><br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA rebels have had a firm grip on the western part of Altis for too long. From <marker name='mkrFIA'>TOWNNAME</marker> they are easily able to conduct raids into our territory and use it as a base for their smuggling operations that are supplying the camps further land inwards. Dislodging them will be a crucial blow to their structure and the first step to regain control of our island. Our platoon is inserted by heli to the West, while mechanized elements are blocking the roads leading away to the east and north-east.
<br/><br/>
ENEMY FORCES
<br/>
The FIA are mostly irregulars with assault rifles, smgs and technicals. In a recent raid the FIA managed to obtain a working Mora IFV as well as an assortment static weapons. It's very possible they are present in the AO.
<br/><br/>
FRIENDLY FORCES
<br/>
<marker name='mkrAAF>Motorized forces</marker> are preventing the FIA from fleeing towards Kavala.
"]];

// ====================================================================================