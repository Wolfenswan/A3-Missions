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
Made by Wolfenswan for Folk ARPS (folkarps.com)<br/>
Contact: wolfenswanarps@gmail.com
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: BACKGROUND

_bg= player createDiaryRecord ["diary", ["Background","
<br/>
MILITARY PUTSCH<br/>
The small island nation of Altis has long been a cause for concern. Deep within CSAT's mediterranean sphere of interest it allegiance was never clear and it's long lasting civil war has ripped the island apart. But as of three months ago a military putsch has toppled the parliament and claims to reinstate order. Albeit not proven yet, it is obvious that NATO has been involved in funding and encouraging this travesty. Under hazy pretense the AAF has already invited NATO 'peace-keepers' to Altis. CSAT cannot allow this development to continue, if they do not want a NATO outpost deep within their own territory.<br/><br/>
SHADU CAMPAIGN<br/>
Time to act is short: Only a few weeks remain before the first NATO troops arrive on Altis. Only the group tied to carrier 'Mandana' and several marine regiments are already active in the area. All of them are immediately redirected towards Altis while the campaign 'Shadu' is prepared. It's objective: To seize all strategical airports on Altis, topple the military regime and prevent NATO from establishing any presence on the island.<br/><br/>
DAY 1: OPERATION MOLOS<br/>
In the first operation of the campaign, a platoon of special forces is deployed in the far north-west to take Molos airport and eliminate hostiles in the surrounding area to prepare a staging area for the main forces.<br/><br/>
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

/*
_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
*** Insert information on administration and logistics here. ***
"]];
*/

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Avoid detection as long as possible.
<br/><br/>
FIRE SUPPORT PLAN
<br/>
A Mi-48 team will become available as CAS support, should the situation become dire.
<br/><br/>
SPECIAL TASKS
<br/>
*** Insert instructions for specific units here. ***
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. Your platoon is inserted along the <marker name='mkrInsert'>western coast</marker>.<br/>
2. Proceed inwards to the town of <marker name='mkrTown'>Molos</marker> and <marker name='mkrAirport'>Molos airport</marker>.<br/>
3. Eliminate the majority of hostiles at Molos and the airport. The officer stationed in Molos has highest priority.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Your platoon is inserted along the west-coast, protected by the darkness of early morning. Seize the <marker name='mkrAirport'>Molos airport</marker> and eliminate the officer in <marker name='mkrTown'>Molos</marker> to disrupt enemy communications. If you alert the enemy in Molos to your presence it is important to dispatch the officer swiftly, otherwise he will most likely call in reinforcements.
<br/><br/>
ENEMY FORCES
<br/>
A mix of AAF regulars and light vehicles. Heavier support might be brought in if the officer is able to call in for reinforcements.<br/>
A group of hellcat pilots is stationed at the <marker name='mkrAirport'>airport</marker> and might attempt to take off if you alert the defenders.
<br/><br/>
"]];

// ====================================================================================