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
Made by Wolfenswan for Folk ARPS (folkarps.com)<br/>
Contact: wolfenswanarps@gmail.com
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

/*
_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
*** Insert information on administration and logistics here. ***
"]];
*/

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.


_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
FIRE SUPPORT PLAN
<br/>
CO has access to a battery of two mortars via the support menu (0-8).<br/>
Due to the fog and the possibility of man-pads AH1 should be used with extreme caution.<br/><br/>
EXTRACTION<br/>
CO and both SLs can request helicopter transport using the support menu (0-8), while indicating a position on the map with your cursor. From inside the extraction helicopter you can order the return to base using the 'Unload Position' radio command (1).
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We are inserted <marker name='mkrInsert'>on the eastern hill</marker>.<br/>
2. Proceed <marker name='mkrFIA'>into the forest</marker> to locate and destroy the creates at FIA storage camps. Up to five (5) caches are expected to be present.<br/>
3. Request extraction (see EXECUTION for details) once you consider the mission complete and return to <marker name='mkrBase'>our eastern base</marker>.
4. Oreokastro and the castle are not your primarty objective but rebels might stage attacks from there.<br/><br/>
DESTROYING CACHES<br/>
To destroy the ammo caches you need to execute the 'Destroy cache' action when facing them.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA is using the hills in north-western Altis to move and store equipment. Your platoon is tasked to descend into the forests to drive out the rebels.
<br/><br/>
ENEMY FORCES
<br/>
The usual rag-tag bunch of FIA forces, probably several squads strong.
<br/><br/>
FRIENDLY FORCES
<br/>
Motorized AAF groups are blocking the southern approaches.
<br/><br/>
RESTRICTIONS
<br/>
The castle is a national heritage and Orekastro should stay intact as well - do not target those areas with mortars or CAS.
"]];

// ====================================================================================