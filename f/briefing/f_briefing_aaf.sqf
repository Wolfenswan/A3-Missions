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

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
All Rifleman AT carry HE rockets.
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
MOVEMENT PLAN<br/>
The direct approach towards the town is quite exposed. Our best are the buildings along the main road, the defilate to the North and the <marker name='mkrFort'>old bunkers</marker> on the southern hill.<br/><br/>
FIRE SUPPORT
<br/>
CO can call in mortar strikes via the radio support menu (0-8).<br/>
Two mortars are available and both carry 32 HE shells as well as 18 smoke and flare shells each.<br/><br/>
REINFORCEMENTS
<br/>
If necessary squad Juliet and an attached HMG strider can reinforce our assault from the east. However, FIA will most likely have prepared heavy defenses against any advance from that direction.
PRIORITY TARGETS
<br/>
Any manpads and static AA in the area need to be destroyed.<br/>
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We are inserted <marker name='mkrInsert'>here</marker>. Markers indicating the drops for each squad, WEP1 is with CO.<br/>
2. Proceed into the indicated AO, towards <marker name='mkrFIA'>Agios Konstantinos</marker>.<br/>
3. Eliminate the majority of the FIA forces and all high priority targets (see TASKS).<br/><br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
FIA rebels have had a firm grip on the western part of Altis for too long. From <marker name='mkrFIA'>Agios Konstantinos</marker> they are able to conduct raids into our territory and use it as a base for their smuggling operations. Dislodging them will be a crucial blow to their operations and the first step towards regaining control of our island.
<br/><br/>
ENEMY FORCES
<br/>
The FIA are mostly irregulars with assault rifles, smgs and technicals. In a recent raid the FIA managed to obtain an assortment of static weapons, including mortars. It's very likely that they will be used in defence of the outpost.
<br/><br/>
FRIENDLY FORCES
<br/>
<marker name='mkrAAF'>Motorized elements</marker> are preventing the FIA from fleeing towards Kavala.<br/>
A mortar battery is on standby and squad Juliet is preparing to reinforce our assault from the east. See EXECUTION for details.
"]];

// ====================================================================================