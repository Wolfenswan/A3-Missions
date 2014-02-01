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
Motorized:<br/>
1 x IFRIT (unarmed)<br/>
3 x 'Marid' APC (HMG) - one per squad<br/>
3 x 'Marid' APC (un-armed) - one per squad<br/><br/>
Air:<br/>
1 x Mi-48 'Kalman'<br/>
2 x PO-30 'Orca' (rockets)
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin <marker name='mkrMoto'>here</marker>.<br/>
2. Proceed into the AO.
3. Eliminate NATO AA support (indicated by <marker name='mkrB'>these markers</marker>) where possible.<br/>
4. Kill the AAF officers in <marker name='mkrAHQ'>Neochori</marker> and <marker name='mkrAHQ_2'>Stavros</marker>.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Since CSAT forces have landed in Altis one month ago, we have been making steady progress against the suprised and overwhelmed AAF. However, these small victories should not be overestimated: In order to gain full control over Altis, we need to seize the <marker name='mkrAir'>central Airport</marker>. The AAF is aware of it's strategical importance and has set up defensive positions at the surrounding towns. A NATO mechanized element further complicates the situation, as they are boosting the AAF's lacking firepower significantly.<br/><br/>
While a combined force of <marker name='mkrArmor'>armored and motorized elements</marker> are going to attack the airport and tie up the defenders there, <marker name='mkrMoto'>our platoon</marker> is tasked to attack via the mountain roads and eliminate the officers of the <marker name='mkrAHQ'>AAF's forward command posts</marker>. The second priority is destryoing the <marker name='mkrB_2'>NATO AA support</marker> in order to regain aerial superiority.
<br/><br/>
ENEMY FORCES
<br/>
AAF: Infantry and light vehicles, possibly Gorgons as well.<br/>
NATO: Infantry and Cheetah AA. Helicopters might be diverted if we get too close.
<br/><br/>
FRIENDLY FORCES
<br/>
None in the direct AO.<br/><br/>
NOTE<br/>
If the attack helicopter is used, it is suggested to enforce a 'no explosive damage to built up areas' ROF.
"]];

// ====================================================================================
