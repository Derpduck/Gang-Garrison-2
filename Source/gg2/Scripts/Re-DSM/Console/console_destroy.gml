console_save_log();

// Empty the console log
ds_list_clear(global.consoleOutputHistory);

ds_list_destroy(global.consoleCommandList);

with(Console)
    instance_destroy();
