global.consoleFont = font_add_sprite(ConsoleFontS, ord("!"), false, 0);

console_options();

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

// TODO: Legacy stuff
global.RCONSentCommand=0

console_init_commands();
