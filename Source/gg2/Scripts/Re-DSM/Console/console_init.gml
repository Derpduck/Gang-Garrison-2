// Console Options
ini_open("Re-DSM.ini");
global.saveConsoleLog = ini_read_real("Console", "SaveConsoleLog", 0);
ini_write_real("Console", "SaveConsoleLog", global.saveConsoleLog);
    
global.consoleLines = ini_read_real("Console", "ConsoleLines", 14);
ini_write_real("Console", "ConsoleLines", global.consoleLines);

global.consoleOpacity = ini_read_real("Console", "ConsoleOpacity", 75);
ini_write_real("Console", "ConsoleOpacity", global.consoleOpacity);
ini_close();

// Console Globals
global.consoleInputHistory = ds_list_create();
global.consoleOutputHistory = ds_list_create();
global.consoleCommands = ds_map_create();
global.consoleCommandsHelp = ds_map_create();
global.consoleInputMaxLength = -1; // TODO: For display purposes, doesn't need global
global.consoleOutputMaxLength = 110; // TODO: Inherited from ESM - needs testing / doesn't need global
global.consoleInputHistoryMax = 100;

// Initialize Console
console_print(COL_YELLOW + "Re-DSM: " + string(DSM_VERSION_STRING));
console_print(COL_YELLOW + "GG2 Client: " + string(GAME_VERSION_STRING));
var currentDateTime;
currentDateTime = date_current_datetime();
console_print(COL_YELLOW + string(date_get_year(currentDateTime)) + "-" + string(date_get_month(currentDateTime)) + "-" + string(date_get_day(currentDateTime)) +
                           " " + string(date_get_hour(currentDateTime)) + ":" + string(date_get_minute(currentDateTime)));
console_print("________________");
console_print("");


// TODO: Print map changes in console

console_init_commands();
