// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

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
Mail Man v1.0
Mission by Tigershark<br/>
<br/><br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
N/A
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
COMMANDER'S INTENT
<br/>
Proceed to <marker name='mkrInsertion'>crash site</marker> and locate the laptop in and around the vicinity of the C-130. Download the data from the laptop and return to base with the crucial information.
<br/><br/><br/>
MOVEMENT PLAN
<br/>
Movement is via appropriated AAF black ops helos provided at FOB. MH-9s available for special tasking if required.
<br/><br/><br/>
FIRE SUPPORT PLAN
<br/>
None available at this time.
<br/><br/><br/>
SPECIAL TASKS
<br/>
Once the laptop is located you can initiate the data transfer by using the Action Menu when close to it.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Our orders are simple. Insert via helo at the <marker name='mkrInsertion'>crash site</marker>. Secure the data by locating the laptop and downloading it to a portable device that Military Intelligence has given us.  Bring the device back to the <marker name='IntelShack'>Intelligence HQ</marker> on base.
<br/><br/>
We must move quickly as CSAT forces are en route and they cannot get to the laptop before we have a chance to secure the data.
<br/><br/>
If the CSAT get to the laptop before we do the mission WILL BE A FAILURE.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
A resupply C-130 just <marker name='mkrInsertion'>crashed</marker> west of here. Although it mainly had munitions and other generic supplies on-board, C2 just informed us it also had a laptop aboard that contains sensitive information.
<br/><br/>
The crash created quite a commotion and this has attracted local CSAT in the surrounding hills that are advancing to the crash site as we speak.
<br/><br/><br/>
ENEMY FORCES
<br/>
Several platoon sized CSAT in the hills surrounding the crash site.
<br/><br/><br/>
FRIENDLY FORCES
<br/>
3 x CH-49 Mohawks <br/>
2 x MH-9 Hummingbirds <br/>
<br/>
"]];

// ====================================================================================