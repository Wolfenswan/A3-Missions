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
MOVEMENT PLAN<br/>
Your insertion will not go unnoticed. Prepare for enemy attacks after touching ground.<br/>
Due to the fog and the possibility of man-pads AH1 should be used with caution and not stay immobile for long.
<br/><br/>
FIRE SUPPORT PLAN
<br/>
CO has access to a battery of two mortars via the support menu (0-8).<br/>
AH1 should be used in conjunction with JTAC/UAV Operator to aquire targets using the laser designator.<br/>
<br/><br/>
EXTRACTION<br/>
CO and both SLs can request helicopter transport using the support menu (0-8), while indicating a position on the map with your cursor. From inside the extraction helicopter you can order the return to base using the 'Unload Position' radio command (1).
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We are inserted <marker name='mkrStart'>on the eastern hill</marker>.<br/>
2. Proceed <marker name='mkrFIA'>into the forest</marker> to locate and destroy the creates at FIA storage camps. Up to five (5) caches are expected to be present in the area indicated by the blue rectangle.<br/>
3. Request extraction (see EXECUTION for details) once you consider the mission complete and return to <marker name='mkrBase'>our eastern base</marker>.<br/>
4. Oreokastro and the castle are not your primarty objective but rebels might stage attacks from there.<br/><br/>
DESTROYING CACHES<br/>
To destroy the ammo caches you need to execute the 'Destroy cache' action when facing them.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA is using the hills in north-western Altis to move and store equipment. Your platoon is tasked to descend into the forests to drive out the rebels.
<br/><br/>
ENEMY FORCES
<br/>
The usual rag-tag bunch of FIA forces, probably several squads strong.
<br/><br/>
FRIENDLY FORCES
<br/>
Motorized AAF groups are blocking the southern approaches.
<br/><br/>
RESTRICTIONS
<br/>
The castle is a national heritage and Orekastro should stay intact as well - do not target those areas with mortars or CAS.
"]];

// ====================================================================================
