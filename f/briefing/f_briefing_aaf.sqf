// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: GREEN

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
Alpha and Bravo start in their designated trucks<br/>
1 x 'Strider' MRAP (no thermals)<br/>
1 x 'Stomper' UGV (HMG - no thermals)
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Dislodge any FIA presence from the village and mountaintop. Use Juliet to ambush any reinforcements coming from Abdera.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Juliet is <marker name='f_insert'>inserted</marker> in the north. HQ suggests <marker name='mkrAmbush'>these</marker> <marker name='mkrAmbush_1'>two</marker> locations to ambush any FIA reinforcements. Do not move too close to Abdera, as it might alert further FIA forces.
<br/><br/>
<font size='18'>FIRE SUPPORT</font>
<br/>
Juliet SL is in contact with a mortar battery.
<br/><br/>
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. Juliet and MMG1 are inserted <marker name='f_insert'>here</marker> by helicopter, the rest of the platoon is moving in from <marker name='mkrVeh'>this direction</marker>.<br/>
2. Attack <marker name='mkrGalati'>Galati</marker> and clear if of any enemy presence. We expect this to prompt reinforcements from <marker name='mkrAbdera'>Abdera</marker>.<br/>
3. Juliet ambushes the reinforcements while the motorized element clears out Galati.<br/>
4. If forces permit, merge your elements to clear the <marker name='mkrTop'>mountain top</marker> as a foothold for further operations.<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA rebels have been roaming freely in north-west Altis for far too long, repeatedly disrupting our supply lines and raiding villages. Our platoon is moving in in the early morning hours to dislodge the FIA from their stronghold in Galati.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Lightly armed irregular forces with vehicle support.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
A recon team is in place west of Abdera to monitor FIA movement.
<br/><br/>
"]];

// ====================================================================================