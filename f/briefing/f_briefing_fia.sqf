// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: FIA

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
Made by harakka and wolfenswan with love for Folk ARPS. Special thanks to Head for scripting help. Thanks to all FA session players for suggestions and bugreports.
<br/>
<br/>
Uses SHK_moveobjects.sqf and SHK_pos by Shuko: http://forums.bistudio.com/showthread.php?92018-SHK_moveobjects<br/>
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
Each cache is guarded by 2-5 friendly AI units. AAF must use satchel charges to destroy caches. The friendly AI will report enemy sightings to you via map markers, unless they are wiped out very quickly. These markers are accurate to about 30 meters and include a timestamp.
<br/><br/>
TRANSPORT
<br/>
1x Offroad with CO and DC premounted<br/>
For each squad 1 x Offroad and 1 x Truck.<br/>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
COMMANDER'S INTENT
<br/>
Assist our comrades in protecting the equipment caches, and eliminate any AAF soldiers sent to destroy them.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission",format["
OBJECTIVES<br/>
Protect the weapon caches and eliminate AAF troops. The enemy is victorious if they destroy %1 out of %2 caches, or all of our soldiers are dead.
",ha_param_cacheVictoryNum,ha_param_cacheNum]]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
An ex-comrade has leaked information to AAF about the location of our equipment caches, and AAF is on their way to destroy them. This valuable equipment is vital in our strife to keep our country free and has been acquired at great expense. The caches must be protected with any available means until we can relocate them. Our boys are already standing guard at each cache. Your job is to help safeguard the caches, and hunt down the AAF soldiers sent to destroy them.
<br/><br/>
ENEMY FORCES
<br/>
AAF force of unknown size, no armed vehicles or armor.
<br/><br/>
FRIENDLY FORCES
<br/>
Every cache is manned by 2-5 comrades. Konstantinos is ill and couldn't come today, so Vasilis is filling out for him. If you see him, don't joke about the amateurishly wrapped shemagh, he tries really hard.
"]];

// ====================================================================================