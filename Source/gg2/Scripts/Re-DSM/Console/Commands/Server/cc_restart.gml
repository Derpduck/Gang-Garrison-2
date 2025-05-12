console_add_command('restart', '
global.consoleMapChangeQueued = true;
global.winners = TEAM_SPECTATOR;
console_print(COL_ORANGE + "Restarting current map");
', '
console_print(COL_ORANGE + "Syntax: restart");
console_print(COL_ORANGE + "Restarts the current map");
', CC_HOST_RCON);
