// Initialize Console
console_print("");
console_print(COL_YELLOW + "Re-DSM: " + COL_WHITE + string(DSM_VERSION_STRING));
console_print(COL_YELLOW + "GG2 Client: " + COL_WHITE + string(GAME_VERSION_STRING));
var currentDateTime, serverName;
currentDateTime = date_current_datetime();
if (global.joinedServerName == "")
    serverName = global.serverName;
else
    serverName = global.joinedServerName;
console_print(COL_YELLOW + "Server: " + COL_WHITE + global.serverName);
console_print(COL_YELLOW + "Connected At: " + COL_WHITE + date_datetime_string(currentDateTime));
console_print("");
console_print(COL_GRAY + "________________");
console_print("");

console_get_command_list();
