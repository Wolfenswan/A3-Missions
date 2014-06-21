// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CSAT

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
Made by Wolfenswan for Folk ARPS.<br/>
wolfenswanarps@gmail.com
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
MAIN FORCE:<br/>
1 x Ifrit<br/>
5 x 'Marid'- APC (HMG)<br/><br/>
REINFORCEMENTS:<br/>
2 x 'Marid'- APC (HMG)<br/>
1 x BTR-K<br/>
1 x Support Truck (Ammo)<br/><br/>
RESUPPLY:<br/>
All Marids carry spare ammunition. The Ifrit carries extra Darter UAVs if required.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
RECON
<br/>
A UAV operator is attached to the element. Spare UAVs are carried by the Ifrit.
<br/><br/>
MOVEMENT PLAN
<br/>
Use the mobility of the APCs to your advantage. Avoid exhaustion by running everywhere.
<br/><br/>
FIRE SUPPORT PLAN
<br/>
Once the AA is disabled helicopter CAS is available.
<br/><br/>
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin <marker name='mkrMoto'>here</marker>.<br/>
2. Proceed into the AO (highlighted area).<br/>
3. Eliminate NATO AA support (indicated by <marker name='mkrB'>these markers</marker>).<br/>
4. Kill the AAF officers in <marker name='mkrAHQ_1'>Alikampos</marker> and <marker name='mkrAHQ'>Neochori</marker>.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
To gain full control over Altis CSAT forces need to seize the central airport. While a combined force of <marker name='mkrArmor'>armored and mechanized elements</marker> are going to attack the airport and tie up the defenders there, <marker name='mkrMoto'>our platoon</marker> is tasked to attack via the mountain roads and eliminate the officers at the <marker name='mkrAHQ'>AAF's forward command posts</marker>. The second objective is destroying the <marker name='mkrB'>NATO SPAAG support</marker> in order to regain aerial superiority.
<br/><br/>
ENEMY FORCES
<br/>
AAF: Infantry and light vehicles, possibly Gorgons in Neochori.<br/>
NATO: Infantry and Cheetah SPAAG. They might divert airborn forces from the North if we put too much pressure on Neochori.
<br/><br/>
FRIENDLY FORCES
<br/>
A element is at standby to reinforce once we are pushing towards Neochori.<br/><br/>
"]];

// ====================================================================================
