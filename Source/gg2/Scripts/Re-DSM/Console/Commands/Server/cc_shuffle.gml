console_add_command('shuffle', '
if (shuffle_rotation(true))
    console_print(COL_ORANGE + "Shuffled map rotation");
else
    console_print(COL_RED + "[ERROR] Failed to shuffle map rotation");
', '
console_print(COL_ORANGE + "Syntax: shuffle");
console_print(COL_ORANGE + "Shuffles the current map rotation");
', console_init_access_level('shuffle', CC_HOST_RCON));
