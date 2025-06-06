console_add_command('slots', '
if (console_validate_args(1, arg[0], "slots <player limit>") == false) exit;

if (!string_is_real(arg[1]))
{
    console_print(COL_RED + "[ERROR] " + COL_YELLOW + arg[1] + COL_RED + " is not a valid number");
    break;
}

var newSlots;
newSlots = real(arg[1]);

if (newSlots >= 1 - global.dedicatedMode and real_is_int(newSlots))
{
    if (newSlots > 48)
    {
        newSlots = 48;
        console_print(COL_RED + "WARNING: Player limit must be less than 48; limiting slots to 48");
    }

    var totalClasslimits;
    for (i=0; i<10; i+=1)
    {
        totalClasslimits = global.classlimits[i];
    };
    
    if (totalClasslimits < newSlots div 2)
    {
        console_print(COL_RED + "WARNING: Player limit is too low for current classlimits");
    }
    
    if (newSlots == global.playerLimit)
    {
        console_print(COL_ORANGE + "Player limit is already set to: " + COL_YELLOW + string(newSlots));
    }
    else
    {
        global.playerLimit = newSlots;
        console_print(COL_ORANGE + "Player limit set to: " + COL_YELLOW + string(newSlots));
    }
}
else
{
    console_print(COL_RED + "[ERROR] " + COL_YELLOW + arg[1] + COL_RED + " is not a valid number of slots");
}
', '
console_print(COL_ORANGE + "Syntax: slots <player limit>");
console_print(COL_ORANGE + "Sets the number of player slots allowed the server");
', console_init_access_level('slots', CC_HOST_RCON));
