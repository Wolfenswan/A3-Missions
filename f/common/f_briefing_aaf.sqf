// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: GREEN

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
VEHICLES<br/>
Up to 2 x 'Strider HMG' MRAP(no thermals)<br/>
Up to 1 x 'Gorgon' IFV (no thermals)
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Dislodge any FIA presence from the villages and mountaintop.
<br/><br/>
FIRE SUPPORT PLAN
<br/>
Three mortar units are on standby, controlled by the dedicated spotter.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We are inserted <marker name='f_insert'>here</marker>, any vehicle support moving in from <marker name='mkrVeh'>this direction</marker>.<br/>
2. Clear <marker name='mkrGalati'>Galati</marker> and vincinity of hostile forces.<br/>
3. Investigate the <marker name='mkrTop'>mountain top</marker> and destroy all enemy presence.<br/>
4. If forces admit proceed to <marker name='mkrAbdera'>Abdera</marker> to wipe out remaining FIA forces.<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA rebels have been plagueing north-west Altis for a long time now, repeatedly disrupting our supply lines and raiding villages. Our platoon is inserting in the early morning hours to clear house in two FIA strongholds and to weaken their local presence.
<br/><br/>
ENEMY FORCES
<br/>
Lightly armed irregular forces with vehicle support.
<br/><br/>
FRIENDLY FORCES
<br/>
None.
"]];

// ====================================================================================