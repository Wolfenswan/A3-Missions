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
Up to 2 x 'Strider' MRAP (no thermals)
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Dislodge any FIA presence from the villages and mountaintop. Use Alpha squad to ambush any reinforcements coming from Abdera.
<br/><br/>
MOVEMENT PLAN
<br/>
Alpha is <marker name='f_insert'>in the north</marker> and move to an ambush location. HQ suggests <marker name='mkrAmbush'>these</marker> <marker name='mkrAmbush_1'>two</marker> locations. Do not move too close to Abdera, as it might alert the FIA to what we are up to. The rest of the platoon assaults Galati head on, in order to lure out enemy reinforcements. HQ suggests either of the <marker name='mkrApproach'>two routes</marker> though advises against an attack from the direct south-west.
<br/><br/>
FIRE SUPPORT PLAN
<br/>
Two mortar units are on standby, controlled by the dedicated spotter.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. Alpha is inserted <marker name='f_insert'>here</marker> by helicopter, the rest of the platoon is moving in from <marker name='mkrVeh'>this direction</marker>.<br/>
2. Attack <marker name='mkrGalati'>Galati</marker>, to prompt reinforcements to move in from the direction of <marker name='mkrAbdera'>Abdera</marker>.<br/>
3. Alpha ambushes the reinforcements while the motorized element clears out Galati.<br/>
4. Merge your elements to clear the <marker name='mkrTop'>mountain top</marker> and take the nearby <marker name='mkrRelay'>comm tower</marker>.<br/>
5. If forces permit proceed to <marker name='mkrAbdera'>Abdera</marker>, to wipe out remaining FIA forces.<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA rebels have been plagueing north-west Altis for a long time now, repeatedly disrupting our supply lines and raiding villages. Our platoon is moving in in the early morning hours to clear house in two FIA strongholds and to weaken their local presence.
<br/><br/>
ENEMY FORCES
<br/>
Lightly armed irregular forces with vehicle support.
<br/><br/>
FRIENDLY FORCES
<br/>
A recon team is in place west of Abdera to monitor FIA movement.
<br/><br/>
"]];

// ====================================================================================