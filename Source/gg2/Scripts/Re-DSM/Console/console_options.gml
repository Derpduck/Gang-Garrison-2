// Console Options
ini_open("Re-DSM.ini");
global.saveConsoleLog = ini_read_real("Console", "SaveLog", 0);
ini_write_real("Console", "SaveLog", global.saveConsoleLog);
    
global.consoleOutputRows = ini_read_real("Console", "OutputWindowRows", 14);
ini_write_real("Console", "OutputWindowRows", global.consoleOutputRows);

global.consoleOpacity = ini_read_real("Console", "WindowOpacity", 75);
ini_write_real("Console", "WindowOpacity", global.consoleOpacity);

global.consoleAutocomplete = ini_read_real("Console", "TabAutocomplete", 1);
ini_write_real("Console", "TabAutocomplete", global.consoleAutocomplete);

global.consoleTimestamps = ini_read_real("Console", "ShowTimestamps", 0);
ini_write_real("Console", "ShowTimestamps", global.consoleTimestamps);

global.consoleBoldFont = ini_read_real("Console", "BoldFont", 0);
ini_write_real("Console", "BoldFont", global.consoleBoldFont);


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
