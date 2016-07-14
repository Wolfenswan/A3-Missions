// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: SYNDIKAT

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
CACHES
<br/>
Each cache is guarded by a few friendly AI units. CSAT must use satchel charges to destroy caches. The friendly AI will report enemy sightings to you via map markers, unless they are wiped out very quickly. These markers are accurate to about 30 meters and include a timestamp.
<br/><br/>
TRANSPORT
<br/>
1x Offroad with CO & MMG1 premounted<br/>
Each squad is premounted in 1 x Truck (SL + FT1) and 1 x Offroad (FT2).<br/>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Assist our comrades in protecting the equipment caches, and eliminate any hostile forces sent to destroy them.<br/><br/>
<font size='18'>DEPLOYMENT</font>
<br/>
All vehicle drivers have a teleport option, which they can use to move their vehicle (including passengers) to the desired location. Deplyoment is restricted to roughly <marker name='ws_defend_start'>100m around the indicated location</marker>. <br/> IMPORTANT: All units need to be in the vehicles for this to work as intended.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format["
OBJECTIVES<br/>
Protect the weapon caches and eliminate AAF troops. The enemy is victorious if they destroy %1 out of %2 caches, or all of our soldiers are dead.<br/>
If the attackers take %3 percent casualties, the mission will be considered a failure.
",ha_param_cacheVictoryNum,ha_param_cacheNum,ws_param_aafCas]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
An ex-comrade has leaked information to CSAT about the location of our equipment caches, and CSAT is on their way to destroy them. This valuable equipment is vital in our strife to keep our country free and has been acquired at great expense. The caches must be protected with any available means until we can relocate them. Our boys are already standing guard at each cache. Your job is to help safeguard the caches, and hunt down the AAF soldiers sent to destroy them.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
CSAT force of unknown size, no armed vehicles or armor. They are approaching from outside the red circle.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
Every cache is manned by a few comrades. Francoise is ill and couldn't come today, so Vasilis is filling out for him. If you see him, don't joke about the amateurishly wrapped shemagh, he tries really hard.
"]];

// ====================================================================================