console_add_command('lobby', '
global.useLobbyServer = !global.useLobbyServer;
if (global.useLobbyServer)
    console_print(COL_ORANGE + "Server is now visible in the lobby");
else
        console_print(COL_ORANGE + "Server is no longer visible in the lobby");
', '
console_print(COL_ORANGE + "Syntax: lobby");
console_print(COL_ORANGE + "Toggles server" + SINGLE_QUOTE + "s visibiliy in the lobby");
', console_init_access_level('lobby', CC_HOST));
