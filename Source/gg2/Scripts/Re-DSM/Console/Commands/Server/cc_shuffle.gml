console_add_command('shuffle', '
ds_list_shuffle(global.map_rotation);
console_print(COL_ORANGE + "Shuffled map rotation");
', '
console_print(COL_ORANGE + "Syntax: shuffle");
console_print(COL_ORANGE + "Shuffles the current map rotation");
', CC_HOST_RCON);
