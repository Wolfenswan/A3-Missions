// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: FIA

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
Made with love for Folk ARPS by Fer and Wolfenswan.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
<font size='18'>STARTING POSITIONS</font><br/>
Whilst coming ashore our squads have become dispersed.
<br/><br/>
<font size='18'>EMBEDDED REPORTERS</font><br/>
Up to 2 reporters may have landed with us.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.
/*
_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
*** Insert very short summary of plan here. ***
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
*** Insert movement instructions here. ***
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
*** Insert fire support instructions here. ***
<br/><br/>
<font size='18'>SPECIAL TASKS</font>
<br/>
*** Insert instructions for specific units here. ***
"]];*/


// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Sieze <marker name = 'mkrObj3'>Krya Nera</marker> and the nearby <marker name = 'mkrObj4'>airstrip</marker>.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Our landing against Ammolofi Bay is in disarray, but we can still seize our objectives before the enemy reserve arrives.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
A company of enemy infantry holds <marker name = 'mkrObj3'>Krya Nera</marker> and the nearby <marker name = 'mkrObj4'>airstrip</marker>, but small detachments will be billeted nearby. Reserve units are expected from the direction of <marker name = 'mkrReserve'>Abdera</marker>.
<br/><br/>
"]];

// ====================================================================================