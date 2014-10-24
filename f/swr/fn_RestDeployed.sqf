// F3 - Simple Weapon Resting
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Runs while you are deployed

f_rest_deployed = true;
while{sleep 0.1;[] call f_fnc_restCanDeploy} do
{
	uiNamespace getVariable ['f_resting_overlay_id',0] displayCtrl 3883 ctrlSetTextColor [1,1,1,0.3];
	if(stance player == "PRONE") then
	{
		player setUnitRecoilCoefficient 0.65;
	}
	else
	{
		player setUnitRecoilCoefficient 0.25;
	};
};
player setUnitRecoilCoefficient 1;
uiNamespace getVariable ['f_resting_overlay_id',0] displayCtrl 3883 ctrlSetTextColor [1,1,1,0];
player sidechat "stopped resting";
f_rest_deployed = false;