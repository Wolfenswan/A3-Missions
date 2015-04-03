// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: AAF

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

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Hold the <marker name='mkrAO'>facility</marker> by keeping FIA out of the highlighted areas.<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA raiders are threatening one of our <marker name='mkrAO'>storage facilities</marker>. We need to repell them.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Not more than a platoon worth of infantry.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
None.
"]];

// ====================================================================================