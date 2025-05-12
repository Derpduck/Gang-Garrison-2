console_add_command('clear', '
ds_list_clear(global.consoleOutputHistory);
', '
console_print(COL_ORANGE + "Syntax: clear");
console_print(COL_ORANGE + "Removes all console output history");
', CC_CLIENT);
