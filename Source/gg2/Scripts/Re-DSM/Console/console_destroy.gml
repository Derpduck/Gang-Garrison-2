console_save_log();

// Clear the console log
ds_list_clear(global.consoleOutputHistory);

// Clear sorted list of commands
ds_list_clear(global.consoleCommandList);

with(Console)
    instance_destroy();
