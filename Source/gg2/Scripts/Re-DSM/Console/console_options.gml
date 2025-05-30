// Console Options
ini_open("Re-DSM.ini");
global.saveConsoleLog = DSM_add_option("Console", "Save Log", 0);
global.consoleOutputRows = DSM_add_option("Console", "Output Window Rows", 14);
global.consoleOpacity = DSM_add_option("Console", "Window Opacity", 75);
global.consoleAutocomplete = DSM_add_option("Console", "Tab Autocomplete", 1);
global.consoleTimestamps = DSM_add_option("Console", "Show Timestamps", 0);
global.consoleBoldFont = DSM_add_option("Console", "Bold Font", 0);

// RCON Options
global.rconEnabled = DSM_add_option("RCON", "Rcon Enabled", 1);
global.saveRconUsers = DSM_add_option("RCON", "Save Rcon Users", 1);
global.rconPassword = DSM_add_option_string("RCON", "Rcon Password", "");
ini_close();


// Console Controls
ini_open("controls.gg2");
global.consoleKey = ini_read_real("DSM", "ConsoleKey", vk_f3);
global.consoleFullscreenKey = ini_read_real("DSM", "ConsoleFullscreenKey", vk_f4);
ini_close();
