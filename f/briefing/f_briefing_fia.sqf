// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: FIA

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
It looks like our electronics got scrambled in the crash and there isn't a single good old paper map on this piece of shit future-tech.<br/>
We are also low on ammo and lost most of our gear in the crash. We have grabbed emergency flares from the helicopter.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
1. We are at the crash location, somewhere in western Altis.<br/>
2. Get your bearings and establish contact to NATO troops (flares, chemlights etc.).<br/>
3. Bring all surviving troops back to base.<br/><br/>
<b>OPTIONAL:</b><br/>
1. Ensure the colonels survival.<br/>
2. Use the demo charges transported by the extraction helicopter to destroy the wreck.<br/>
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
As part of a CTRG troop embedded with the FIA resistance, we were tasked to exfill a sympathizing AAF colonel. The whole thing went to shit and we had to shoot our way out. Although we reached the helicopter, it was shot down shortly afterwards and we went down somewhere in Tanoa.
<br/><br/>
ENEMY FORCES
<br/>
AAF forces will be on their way to mop up the survivors and take out the colonel.<br/><br/>
FRIENDLY FORCES
<br/>
NATO troops will hopefully be on their way to extract us.<br/><br/>
RADIO CONTACT<br/>
Host decides whether the survivors have radio contact to the NATO helicopter right from the beginning or only after a certain time. It is suggested to let the helicopter know the rough direction of the crash but only establish radio contact once visual confirmation took place.
"]];

// ====================================================================================