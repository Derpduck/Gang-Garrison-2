console_add_command('quit', '
console_save_log();
game_end();
', '
console_print(COL_ORANGE + "Syntax: quit");
console_print(COL_ORANGE + "Immediately quits the game to desktop");
', CC_CLIENT);
