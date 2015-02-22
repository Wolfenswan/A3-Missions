// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: FIA

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

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
An unarmed Hellcat and a Darter are present to provide intelligence. The Darter is already in the air above Pyrgos, the UAV controller can connect to it using his terminal.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
We have better firepower and protection than the mob, the more we can avoid close quarters the better.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
We need to move with haste if we want to intercept the Boss.
<br/>
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Move into Pyrgos, locate the boss and take him out before he can escape. They will try to pick him up along the western shore.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
The boss of the Pyrgos mafia has been eluding us for too long. The plan was to strike while he's paying his respects at <marker name='mkrSting'>the Pyrgos graveyard</marker> but someone must have tipped them off. The first unit was wiped out and now you'll have to finish the job.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
The Altis mafia prefers pistols and small SMGs but doesn't have access to military equipment.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
Friendly units are blocking off the <marker name='mkrAPD_1'>northern</marker> and <marker name='mkrAPD_2'>southern</marker> exit.
<br/><br/>
<font size='18'>HOUSE RULE</font><br/>
Although tempting the gang must not equip police vests from dead officers.
"]];

// ====================================================================================