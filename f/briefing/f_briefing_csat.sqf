// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CSAT

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

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
The players have crash-landed at the indicated location. They have neither maps nor GPS and need to coordinate with a transport helicopter to extract. Your task is to provide a challenge and to keep the players on the move.
<br/><br/>
AVAILABLE ADDONS
<br/>
You can place units from both BLUFOR and INDEPENDENT side. INDEPENDENT is hostile to the players, use BLUFOR only if you intend to simulate reinforcements or friendly guerilla.<br/>
Several useful tools can be found in the 'modules'-category. Use Zeus>Remote Control to steer AI.<br/><br/>
CONDUCT
<br/>
An initial period of around 5 minutes is suggested to let players get an idea of where they might be and what the surroundings look like.<br/>Place units logically - it should make sense how they got there and why they are attacking from that angle.<br/>Do not constantly but pressure on the players, give them some time to breath and focus while you are preparing AI elsewhere.
"]];

// ====================================================================================