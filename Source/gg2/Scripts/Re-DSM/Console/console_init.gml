global.consoleFont = font_add_sprite(ConsoleFontS, ord("!"), false, 0);

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
global.consoleInputHistoryMax = 8192; // Hard limit to prevent memory issues
global.consoleOutputHistoryMax = 8192; // Hard limit to prevent memory issues

// Console Size
global.consoleWidth = 792; // Default value, updated live in Console draw event
global.consoleTextPadding = 6;

// Initialize Console
console_print(COL_YELLOW + "Re-DSM: " + COL_WHITE + string(DSM_VERSION_STRING));
console_print(COL_YELLOW + "GG2 Client: " + COL_WHITE + string(GAME_VERSION_STRING));
var currentDateTime;
currentDateTime = date_current_datetime();
console_print(COL_YELLOW + "Game Launched: " + COL_WHITE + date_datetime_string(currentDateTime));
console_print("");
console_print(COL_GRAY + "________________");
console_print("");


// TODO: Print map changes in console
// TODO: Expand console input box to accommodate new lines / longer inputs, automatically add line break when string gets too long

console_init_commands();
