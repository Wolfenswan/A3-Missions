// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CSAT

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
CO + MMG1 are mounted in an unarmed Ifrit.<br/>
Each squad starts in his own truck.<br/>
"]];


// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. Seize the <marker name='mkrAO'>facility</marker>. If for 120 seconds the number of CSAT units outweight the numbers of present AAF, CSAT will have taken it.<br/>
2. We can use the <marker name='mkrTown'>town</marker> to our advantage, but AAF might try the same.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
We are tasked to seize one of the AAF's <marker name='mkrAO'>storage facilities</marker>.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Not more than a platoon worth of infantry.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
None.
"]];

