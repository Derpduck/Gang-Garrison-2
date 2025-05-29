// Only run for hosts
if (!global.isHost)
    return -1;

var freezeTimeTimer, freezeTimeDone;
freezeTimeTimer = argument0;
freezeTimeDone = false;

// Exit if freeze time is over
if (freezeTimeTimer <= -1)
    return freezeTimeTimer;

if (!global.run_virtual_ticks)
    return freezeTimeTimer;

// Decrement timer
// If ready-up is added, stop timer from going down here while in ready-up
if (freezeTimeTimer > 0)
{
    freezeTimeTimer -= 1;
}

// Show messages if enabled
var message;
if (freezeTimeTimer == 0)
{
    // Only run on the frame the timer hits 0
    freezeTimeDone = true;
    
    if (global.freezeTimeShowCountdown)
    {
        message = "Round is live!";
        ServerMessageString(global.sendBuffer, message);
        create_notice_message(message);
    }
}
else if (freezeTimeTimer mod 30 == 0)
{
    if (global.freezeTimeShowCountdown)
    {
        message = "Round will begin in: " + string(ceil(freezeTimeTimer / 30)) + " seconds";
        ServerMessageString(global.sendBuffer, message);
        create_notice_message(message);
    }
}

// If timer hits 0, reset stats / resources (uber, metal, ammo, etc)
if (freezeTimeDone)
{
    freezeTimeTimer = -1;
    
    // Reset players to their spawn states
    with(Character)
    {
        hp = maxHp;
        ubered = 0;
        moveStatus = 0;
        nutsNBolts = maxNutsNBolts;
    }
    
    // Refill ammo
    with(Weapon)
    {
        ammoCount = maxAmmo;
    }
    
    // Kill any sentries
    with(Sentry)
    {
        hp -= 999;
        lastDamageDealer = noone;
    }
    
    // Remove uber charge build-up
    with(Medigun)
    {
        ubering = false;
        uberCharge = 0;
        uberReady = false;
    }
}

// TODO: Allow instant respawning during freeze time

GameServer.syncTimer = 1;
return freezeTimeTimer;
