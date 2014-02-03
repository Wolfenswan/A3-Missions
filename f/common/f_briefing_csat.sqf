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
Made by Wolfenswan for Folk ARPS.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
Up to:<br/>
1 x Ifrit - unarmed<br/>
2 x Ifrit - HMG (no thermal sights)<br/>
2 x Zamak Transports (loaded with Alpha and Bravo respectively)<br/>
1 x Orca Transport - armed (loaded with Delta)
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Secure the convoy area and seize the crates.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin a few k away from the <marker name='fia_conv'>convoy</marker>.<br/>
2. We need to reach the <marker name='fia_conv'>convoy</marker> and seize the caches.<br/>
3. FIA forces at the convoy will most likely offer heavy resistance. Use all force necessary.<br/>
4. NATO heliborn forces might be send from <marker name='mkrNATO'>their foothold</marker>. Deal with them as the need arises.<br/><br/>
NOTE<br/>
To seize the crates at least one CSAT unit must be within 10m of them for one full minute.<br/>
For NATO to be successful they need to either wipe out the CSAT platoon or destroy all four crates and the HEMTT and fall back at least 2.5k from the AO.<br/>
All four caches are next to the HEMTT truck. The crates and the truck can only be destroyed by demo charges.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
A Mi-48 on morning patrol intercepted a <marker name='fia_conv'>FIA convoy</marker>. Before engaging the gunner noticed unusual activity around one of the vehicles.
As our intelligence service has been suspecting that the NATO forces on the island have been supplying FIA in order to undermine our presence we are going to send your platoon to investigate, mob up the FIA survivors and if seize all NATO caches as proof.
<br/><br/>
ENEMY FORCES
<br/>
Light FIA forces, some of the M2 technicals accompanying the convoy might still be operational.<br/>
If our suspicion is true, NATO heliborn forces might be deployed to remove all evidence.
<br/><br/>
FRIENDLY FORCES
<br/>
None.<br/><br/>
NOTE<br/>
This can be played as a three-way adversarial where FIA have to defend the caches at all costs while NATO wants nothing but to destroy them.
"]];

// ====================================================================================