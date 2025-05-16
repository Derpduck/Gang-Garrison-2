// Save bind to file and map
var bindKey, bindCommand;
bindKey = argument0;
bindCommand = argument1;

if (ds_map_exists(global.bindsMap, bindKey))
{
    // Remove any existing bind on the key first
    bind_remove(bindKey);
}

ds_map_add(global.bindsMap, bindKey, bindCommand);

// Get binds file
var fileHandle;
fileHandle = file_text_open_append(working_directory + "\DSM\Binds.txt");

// Write to file
file_text_write_string(fileHandle, string(bindKey) + "{@}" + bindCommand);
file_text_writeln(fileHandle);
file_text_close(fileHandle);
