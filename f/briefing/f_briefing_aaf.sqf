// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: AAF

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Made by harakka and wolfenswan with love for Folk ARPS. Special thanks to Head for scripting help. Thanks to all FA session players for suggestions and bugreports.
<br/>
<br/>
Uses SHK_POS by Shuko<br/>
Uses Wolfenswan's function library: http://www.folkarps.com/forum/viewtopic.php?f=48&t=785
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
DESTROYING CACHES
<br/>
Satchel charges must be used to destroy caches. Fireteam leaders, assistant automatic riflemen and riflemen carry one satchel each.
<br/><br/>
TRANSPORT
<br/>
1x Strider (CO)<br/>
3x Transport truck with one squad pre-mounted per truck</br>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Destroy the marked FIA equipment caches by using satchels, with minimum casualties to your squad.<br/><br/>
<font size='18'>DEPLOYMENT</font>
<br/>
CO and all SL have a teleport option, which they can use to move their vehicle (including passengers) to the desired location. Deplyoment is restricted to outside the red circle. <br/> IMPORTANT: All units need to be in the vehicles for this to work as intended.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format["
OBJECTIVES<br/>
Destroy FIA weapon caches. Mission is successful once either %1 out of %2 caches are destroyed, or all FIA units have been eliminated.<br/>
If the attackers take %3 percent casualties, the mission will be considered a failure.
",ha_param_cacheVictoryNum,ha_param_cacheNum,ws_param_aafCas]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
AAF intel has indicated <marker name='mkrBorder'>locations of several FIA guerrilla equipment caches</marker>.
However FIA is about to relocate the caches, and we must move in swiftly to intercept them and destroy the caches.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
FIA guerrillas, number unknown. No armed vehicles or armor. The caches are very likely to be guarded. The enemy can communicate your location amongst themselves if you are spotted.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
CSAT are high on kat most of the time. Don't expect any help.
<br/><br/>
<font size='18'>DEPLOYMENT</font>
<br/>
Special rules apply to troop deployment via group teleport. See EXECUTION for details.
"]];

// ====================================================================================