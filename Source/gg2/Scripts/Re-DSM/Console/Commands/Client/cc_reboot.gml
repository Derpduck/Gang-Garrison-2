console_add_command('reboot', '
console_save_log();
restartGG2();
', '
console_print(COL_ORANGE + "Syntax: reboot");
console_print(COL_ORANGE + "Immediately re-launches the game");
', console_init_access_level('reboot', CC_CLIENT));
