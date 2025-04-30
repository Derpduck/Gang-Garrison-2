// Console Options
ini_open("Re-DSM.ini");
global.saveConsoleLog = ini_read_real("Console", "SaveConsoleLog", 0);
ini_write_real("Console", "SaveConsoleLog", global.saveConsoleLog);
    
global.consoleLines = ini_read_real("Console", "ConsoleLines", 14);
ini_write_real("Console", "ConsoleLines", global.consoleLines);

global.consoleOpacity = ini_read_real("Console", "ConsoleOpacity", 75);
ini_write_real("Console", "ConsoleOpacity", global.consoleOpacity);

global.consoleAutocomplete = ini_read_real("Console", "ConsoleAutocomplete", 1);
ini_write_real("Console", "ConsoleAutocomplete", global.consoleAutocomplete);


// RCON Options
global.rconEnabled = ini_read_real("RCON", "RconEnabled", 1);
ini_write_real("RCON", "RconEnabled", global.rconEnabled);

global.saveRconUsers = ini_read_real("RCON", "SaveRconUsers", 1);
ini_write_real("RCON", "SaveRconUsers", global.saveRconUsers);

global.rconPassword = ini_read_string("RCON", "RconPassword", "");
ini_write_real("RCON", "RconPassword", global.rconPassword);
ini_close();

// Console Controls
ini_open("controls.gg2");
global.consoleKey = ini_read_real("Controls", "ConsoleKey", vk_f3);
ini_close();
