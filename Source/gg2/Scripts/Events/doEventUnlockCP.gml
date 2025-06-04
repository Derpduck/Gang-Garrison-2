with ControlPoint locked = 0;

if (instance_exists(KothRedControlPoint) and instance_exists(KothBlueControlPoint))
{
    if (!DKothHUD.cpFirstUnlocked)
        DKothHUD.cpFirstUnlocked = true;
}
