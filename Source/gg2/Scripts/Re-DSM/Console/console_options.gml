// Console Options
ini_open("Re-DSM.ini");
global.saveConsoleLog = ini_read_real("Console", "SaveConsoleLog", 0);
ini_write_real("Console", "SaveConsoleLog", global.saveConsoleLog);
    
global.consoleLines = ini_read_real("Console", "ConsoleLines", 14);
ini_write_real("Console", "ConsoleLines", global.consoleLines);

global.consoleOpacity = ini_read_real("Console", "ConsoleOpacity", 75);
ini_write_real("Console", "ConsoleOpacity", global.consoleOpacity);
ini_close();
