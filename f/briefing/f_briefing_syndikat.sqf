// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: SYNDIKAT

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

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>DEPLOYMENT</font>
<br/>
Every element leader has one 'Teleport' action available. Using it will open the map. Clicking somewhere will move the entire group to the location. Try to stay clear of rocks etc.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format ["
<br/>
1. Deploy your groups next to the indicated cache locations (red circles). See EXECUTION for details.<br/>
2. Protect the caches, indicated by green triangles.<br/>
3. CSAT will have to destroy %1 out of %2 caches.
",ws_param_caches_target,ws_param_caches_present]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
We've been tipped off that CSAT will try and raid our smuggling operation. They are welcome to try.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Up to a platoon of CSAT forces in LSVs.
"]];