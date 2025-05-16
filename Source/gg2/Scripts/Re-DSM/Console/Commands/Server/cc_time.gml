console_add_command('time', '
if (console_validate_args(1, arg[0], "time <minutes>") == false) exit;

// Check if number given is actually a number
if (!string_is_real(arg[1]))
{
    console_print(COL_RED + "[ERROR] " + COL_YELLOW + arg[1] + COL_RED + " is not a valid number");
    break;
}

var newTime;
newTime = real(arg[1]);

// Check if time is valid
if (newTime <= 0)
{
    console_print(COL_RED + "[ERROR] " + COL_YELLOW + arg[1] + COL_RED + " is not a valid time");
    break;
}

newTime = floor(newTime * 30 * 60);

with (HUD)
{
    timeLimit = newTime;
    timer = timeLimit;
}

GameServer.syncTimer = 1;

console_print(COL_ORANGE + "Timer set to: " + COL_YELLOW + format_timer_value(newTime));

', '
console_print(COL_ORANGE + "Syntax: time <minutes>");
console_print(COL_ORANGE + "Sets the current round timer to the given number of minutes");
console_print(COL_ORANGE + "Decimal values are accepted, e.g. 0.5 = 30 seconds");
', CC_HOST_RCON);
