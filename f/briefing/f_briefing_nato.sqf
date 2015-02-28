// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

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
A 'Stomper' UGV has landed with Alpha and can be controlled by the UV operator.<br/>
A greyhawk drone equipped with six (6) 'Scalpel'-ATGM is heading towards Altis from the south-east.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
<marker name='mkrAAF_2'>Selakano</marker> has been abandoned by the civilian population but the outskirts might be occupied by AAF forces.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
The greyhawk drone should be kept in reserve to take out any armored vehicles the platoon can't take out easily.
"]];


// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin <marker name='mkrStart'>here</marker>.<br/>
2. Move through the indicated AO, towards the <marker name='mkrAAF'>south-west</marker>.<br/>
3. Dislodge the enemy from the <marker name='mkrAAF'>base</marker> and prepare defensive positions.<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
With the tensions between CSAT and NATO having reached a new high, our position towards the Altis Armed Forces (AAF) and their self-proclaimed neutrality has shifted. Recent intelligence reports suggest that they have been negotiating with CSAT to allow the usage of Altis as a RnR area. <br/><br/>As a pre-emptive measure, NATO is launching an attack to seize and hold a beachhead. Your platoon has reached the south-eastern tip of the island by boats during the night and is now preparing to move out at early morning.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Mostly AAF regulars, supported by vehicles.<br/>
Few patrols in the countryside, but expect built-up areas to be more heavily defended.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
Another platoon is moving in from the north-east to take the airfield near Feres.<br/>
Juliet squad can act as reinforcements if needed and will HALO into the AO.
"]];

// ====================================================================================