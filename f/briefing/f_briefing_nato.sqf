// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Made by Wolfenswan for Folk ARPS.<br/>
Thanks to {C9}Jester for his smoke column script.<br/>
Credits to Shuko for his ARMA2 mission Jolly Green.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
All transport helicopters are carrying satchel charges.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We begin <marker name='mkrNATO'>here</marker>.<br/>
2. Move towards the estimated location of the crash site.<br/>
3. Locate the crash site, destroy the helicopter.<br/>
4. Extract with any survivors (focus on the colonel).<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
A CTRG team embedded with FIA rebels has botched their extraction. They managed to capture their mark - a high ranking AAF colonel - but got into a heavy firefight and their helicopter was shot down shortly after take off. They are probably low on supplies and we do not have been able to establish any contact yes. This operation is clandestine and AAF must not be allowed to get any data from the helicopter.
<br/><br/>
ENEMY FORCES
<br/>
AAF forces are probably on the way to deal with the survivors and gather intel from the helicopter's flight computer.
<br/><br/>
FRIENDLY FORCES
<br/>
Whoever survived the crash will be try to establish contact once we get near to the crash site.<br/><br/>
RADIO CONTACT<br/>
Host decides whether the survivors have radio contact to the NATO helicopter right from the beginning or only after a certain time. It is suggested to let the helicopter know the rough direction of the crash but only establish radio contact once visual confirmation took place.
"]];

// ====================================================================================