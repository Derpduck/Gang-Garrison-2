console_add_command('log', '
var saveLogSetting;
saveLogSetting = global.saveConsoleLog;
global.saveConsoleLog = 1;
console_save_log();
global.saveConsoleLog = saveLogSetting;
', '
console_print(COL_ORANGE + "Syntax: log");
console_print(COL_ORANGE + "Saves the current console log to /../DSM/Logs/");
', console_init_access_level('log', CC_CLIENT));
