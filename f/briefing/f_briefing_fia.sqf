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
Made by Wolfenswan for Folk ARPS.<br/>
Thanks to {C9}Jester for his smoke column script.<br/>
Credits to Shuko for his ARMA2 mission Jolly Green.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
We are very low on ammo and lost most of our gear in the crash. We've taken the emergency flares from the helicopter.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We are at the crash location, somewhere in western Altis.<br/>
2. Get your bearings and establish contact to NATO troops (flares, chemlights etc.).<br/>
3. Bring all surviving troops back to base.<br/>
OPTIONAL:<br/>
1. Ensure the colonels survival.<br/>
2. Use the demo charges transported by the extraction helicopter to destroy the wreck.<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
As part of a CTRG troop embedded with the FIA resistance, we were tasked to free a sympathizing AAF colonel. The whole thing went to shit and we had to shoot our way out. Although we reached the helicopter, it was shot down shortly after and we lost most of our gear in the crash.
<br/><br/>
ENEMY FORCES
<br/>
AAF forces will be on their way to mop up the survivors and take out the colonel.<br/><br/>
FRIENDLY FORCES
<br/>
NATO troops will hopefully be on their way to extract us.<br/><br/>
NOTE<br/>
It's suggested to have no radio contact between CTRG and NATO until they've met.
"]];

// ====================================================================================