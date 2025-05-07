global.consoleFont = font_add_sprite(ConsoleFontS, ord("!"), false, 0);

console_options();

// Console Globals
global.consoleInputHistory = ds_list_create();
global.consoleOutputHistory = ds_list_create();
global.consoleInputHistoryMax = 8192; // Hard limit to prevent memory issues
global.consoleOutputHistoryMax = 8192; // Hard limit to prevent memory issues

// Console Command Mapping
global.consoleCommandMap = ds_map_create();
global.consoleCommandMapHelp = ds_map_create();
global.consoleCommandMapRules = ds_map_create();
global.consoleCommandList = ds_list_create();

// Console Size
global.consoleWidth = 792; // Default value
global.consoleTextPadding = 6;

// RCON
global.isRCON = false;

// Strings within console commands
globalvar SINGLE_QUOTE, DOUBLE_QUOTE;
SINGLE_QUOTE = chr(39);
DOUBLE_QUOTE = chr(34);

console_init_commands();
