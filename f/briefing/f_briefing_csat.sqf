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
CO - Qilin (Unarmed)<br/><br/>
PER SQUAD:<br/>
SL - Quadbike<br/>
FT1 - Qilin (Armed)<br/>
FT2 - Qilin (Unarmed)<br/>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>DEPLOYMENT</font>
<br/>
Every element leader has one 'Teleport' action available. Using it will open the map. Clicking somewhere will move the group's vehicle to the location. It is important that all group members are inside the vehicle when the teleport is used.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
A mortar battery is on standby and under CO's direct command.
<br/><br/>
<font size='18'>SANCTITY OF HISTORIC LANDMARKS</font>
<br/>
Tanoa's Society for the Preservation of Historic Landmarks and Artifacts has asked us to kindly avoid any damage to archaelogical landmarks. We've politely declined their request.
<br/><br/>
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format ["
<br/>
1. Deploy your groups outside the <marker name='mkrAO'>indicated AO</marker>. See EXECUTION for details.<br/>
2. Move towards the suspected cache locations (red circles).<br/>
3. Destroy %1 out of %2 caches.<br/><br/>

INTEL<br/>
The temple is nestled into the mountainside and dominated by a large cliff. Plan accordingly.<br/>
Entrances to the temple complext are marked. The large cliff can also be <marker name='mkrScale'>scaled</marker> from the south-east as well.<br/>
<img image='intel.jpg' width='500' height='312'>
",ws_param_caches_target,ws_param_caches_present]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Syndikat's smuggling operation have gone on for far too long. Today we will stop them.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Up to a platoon of ill-equipped but highly motivated paramilitaries.
"]];

// ====================================================================================
