// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: FIA

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
Both RAT and MAT carry a mix of HE and AT rockets.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.
/*
_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
*** Insert very short summary of plan here. ***
<br/><br/>
MOVEMENT PLAN
<br/>
*** Insert movement instructions here. ***
<br/><br/>
FIRE SUPPORT PLAN
<br/>
*** Insert fire support instructions here. ***
<br/><br/>
SPECIAL TASKS
<br/>
*** Insert instructions for specific units here. ***
"]];
*/
// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Proceed to Styrga and take out the helicopter by any means necessary.<br/>
While you're at it, blow the <marker name='mkrDepot'>AAF supply depot</marker> to smithereens.<br/>
Once both tasks are complete, fall back to the north to complete your mission.

"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Our brothers managed to hit a Kaiman which has been terrorizing our operations in the north-west for ages. It landed at the military post near <marker name='mkrHeli'>Styrga</marker> to refuel and repair. As we're the closest cell, it's on us to take it out for good.
<br/><br/>
ENEMY FORCES
<br/>
The usual assortment of boot-licking, foul-smelling army peons. In the recent weeks they've built <marker name='mkrOutpost'>forward outposts</marker> from which they send patrols into the woods. They'll probably be extra careful while the helicopter is present.<br/>
CSAT might have sent reinforcements to protect their precious little toy. If so, they'll come in from the east.<br/>
If we take too long the helicopter will most likely be used against us once it is in working condition.
"]];

// ====================================================================================