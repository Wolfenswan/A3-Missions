// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CSAT

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

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
The players have crash-landed at the indicated location. They have neither maps nor GPS and need to coordinate with a transport helicopter to extract. Your task is to provide a challenge and to keep the players on the move. Units placed by you won't come equipped with maps or GPS by default.
<br/><br/>
AVAILABLE ADDONS
<br/>
You can place units from both BLUFOR and INDEPENDENT side. INDEPENDENT is hostile to the players, use BLUFOR only if you intend to simulate reinforcements or friendly guerilla.<br/>
Several useful tools can be found in the 'modules'-category. Use Zeus>Remote Control to steer AI.<br/><br/>
CONDUCT
<br/>
An initial period of around 5 minutes is suggested to let players get an idea of where they might be and what the surroundings look like.<br/>Place units logically - it should make sense how they got there and why they are attacking from that angle.<br/>Do not constantly but pressure on the players, give them some time to breathe while you are preparing AI elsewhere. Also keep in mind that heavier vehicles will target and often shred the transport heli.
"]];

// ====================================================================================
