console_add_command('log', '
var saveLogSetting;
saveLogSetting = global.saveConsoleLog;
global.saveConsoleLog = 1;
console_save_log();
global.saveConsoleLog = saveLogSetting;
', '', CC_CLIENT);
