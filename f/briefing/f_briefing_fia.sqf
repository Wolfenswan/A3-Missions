// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: AAF

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Made by Wolfenswan for Folk ARPS.<br/>
Inspired by the original Warlords for Arma2 by Housemaster.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution",format["
<br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Use our protection details as either a force multiplier for the local cell or to out-manoveur CSAT while they try to enter the town.<br/><br/>
<font size='18'>OFFICER MEETING</font><br/>
The starting locations of the officers are randomized and their distance can benefit either of the two sides.<br/>
The meeting takes place at a randomized location. For the meeting to conduct, the two officers have to stay within the indicated circle for %1 consecutive minutes.<br/><br/>
<font size='18'>VICTORY CONDITIONS</font><br/>
FIA wins if both officers conduct their meeting and at least one escapes the vicinity of the town (leave highlighted area).<br/>
CSAT wins if both officers are taken out or the officers flee before the meeting has taken place.
",ws_param_meeting]]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
<font size='18'>Ground-Transport:</font><br/>
2 x Offroads (one for each officer)<br/>
Drive carefully - we don't have any spare tires<br/><br/>
Civilian vehicles can be found in town.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format["
<br/>
1. Move to <marker name='mkrTown'>Agios Dionysios</marker>.<br/>
2. Protect the officers while they conduct their <marker name='meeting'>meeting</marker>.<br/>
3. Repell any assaults by the <marker name='mkrAAF'>CSAT</marker> and provide safe escort for the officers away from the AO.<br/><br/>
",ws_param_meeting]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Two of our leaders are about to hold an important meeting in a <marker name='mkrTown'>nearby town</marker>. While the CSAT has been dormant for a while, we are sure the imperialist pigs will try and take out our beloved comrades. We must not let this happen. See EXECUTION for important details.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
CSAT airborne.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
The local cell will have taken positions in the vicinity of the meeting site. Don't expect too much from them: They are under-equipped and ill trained.
<br/><br/>
"]];

// ====================================================================================