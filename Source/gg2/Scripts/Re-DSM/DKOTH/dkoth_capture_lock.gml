// DKOTH only, and anti-stall enabled
if (!(global.dkothAntiStall and instance_exists(KothRedControlPoint) and instance_exists(KothBlueControlPoint))) exit;

// Capture lock setting in use
if (global.dkothCaptureLockTime <= 0) exit;

// If one team gained control of both points, lock both points
if (KothRedControlPoint.team == KothBlueControlPoint.team)
{
    DKothHUD.cpUnlock = global.dkothCaptureLockTime * 30;
    GameServer.syncTimer = 1;
}
