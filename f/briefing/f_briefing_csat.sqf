// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CSAT

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

// NOTES: BACKGROUND

_bg= player createDiaryRecord ["diary", ["Background","
<br/>
SITUATION IN ALTIS<br/>
The tiny island nation of Altis has long since been a cause for international concern. As of three months ago a military putsch has toppled the parliament, claiming to reinstate order and democracy. Albeit not proven yet, it is obvious that NATO has been involved in funding and further encouraging this travesty. Already the new military junta has invited NATO 'peace-keepers' to Altis. If CSAT does not want a NATO outpost within their own sphere of interest this development must be stopped.<br/><br/>
SHADU CAMPAIGN<br/>
The time-window for the operation is short: Barely a few weeks remain before the first NATO troops are bound to arrive on Altis. The 'Shadu' campaign aims to seize all strategical airports on Altis, topple the military regime and prevent NATO from establishing any presence on the island. While further forces are mobilized the only carrier within operational distance, the 'Mandana', is already preparing to deal the first blow.<br/><br/>
27/07/2030: OPERATION YIELDING SABRE<br/>
In the first operation of the campaign, a platoon of special forces is deployed in the far north-west to assist the inbound marine regiments by disrupting enemy communications at Molos.<br/><br/>
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
All soldiers carry a spare (detached) silencer.<br/>
FTLs carry mine detectors, FTL and AAR carry a demo charge each.<br/>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Given the AAF's pre-occupation with the FIA, they are most likely going to assume us to be just another guerilla raid. Expect things to get worse once they realize who we are.
<br/><br/>
STEALTH
<br/>
While using silencers is an option this mission is not intended to be a quiet affair. Be prepared to detach them once you've been detected and to hit the enemy hard and fast.
<br/><br/>
"]];

/*
<br/><br/>
FIRE SUPPORT PLAN
<br/>
A Mi-48 is being prepped and will be available as CAS support after 20 minutes.
*/

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. Your platoon is inserted along the <marker name='mkrInsert'>western</marker> <marker name='mkrInsert_1'>coast</marker>.<br/>
2. Proceed inwards to the town of <marker name='mkrTown'>Molos</marker> and destroy the comm-tower at the indicated location.<br/>
3. Fall back towards the south-western forest to meet our <marker name='mkrExfil'>FIA contacts</marker>.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Your platoon is inserted by helicopter. Move fast to destroy the AAF comm-tower in Molos. Afterwards move south-west to meet with our FIA contactsW.
<br/><br/>
ENEMY FORCES
<br/>
A mix of infantry and light vehicles.<br/>
Reinforcements are a possibility.
<br/><br/>
FRIENDLY FORCES
<br/>
Other platoons are being prepared to attack the AAF. Closest to you the <marker name='mkrCSAT_1'>3rd Mechanized</marker> will assault the airport from the north-east.<br/>
FIA forces have been disrupting AAF operations all over Altis. There'll probably be smaller skirmishes to our south.
<br/><br/>
"]];

// ====================================================================================
