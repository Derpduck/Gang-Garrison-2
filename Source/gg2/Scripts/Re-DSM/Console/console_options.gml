// Console Options
ini_open("Re-DSM.ini");
global.saveConsoleLog = ini_read_real("Console", "Save Log", 0);
ini_write_real("Console", "Save Log", global.saveConsoleLog);
    
global.consoleOutputRows = ini_read_real("Console", "Output Window Rows", 14);
ini_write_real("Console", "Output Window Rows", global.consoleOutputRows);

global.consoleOpacity = ini_read_real("Console", "Window Opacity", 75);
ini_write_real("Console", "Window Opacity", global.consoleOpacity);

global.consoleAutocomplete = ini_read_real("Console", "Tab Autocomplete", 1);
ini_write_real("Console", "Tab Autocomplete", global.consoleAutocomplete);

global.consoleTimestamps = ini_read_real("Console", "Show Timestamps", 0);
ini_write_real("Console", "Show Timestamps", global.consoleTimestamps);

global.consoleBoldFont = ini_read_real("Console", "Bold Font", 0);
ini_write_real("Console", "Bold Font", global.consoleBoldFont);


// RCON Options
global.rconEnabled = ini_read_real("RCON", "Rcon Enabled", 1);
ini_write_real("RCON", "Rcon Enabled", global.rconEnabled);

global.saveRconUsers = ini_read_real("RCON", "Save Rcon Users", 1);
ini_write_real("RCON", "Save Rcon Users", global.saveRconUsers);

global.rconPassword = ini_read_string("RCON", "Rcon Password", "");
ini_read_string("RCON", "Rcon Password", global.rconPassword);
ini_close();


// Console Controls
ini_open("controls.gg2");
global.consoleKey = ini_read_real("DSM", "ConsoleKey", vk_f3);
global.consoleFullscreenKey = ini_read_real("DSM", "ConsoleFullscreenKey", vk_f4);
ini_close();
