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
global.consoleWidth = 792; // Default value, updated live in Console draw event
global.consoleTextPadding = 6;

// RCON
global.isRCON = false;

// TODO: Legacy stuff
global.RCONSentCommand=0

console_init_commands();
