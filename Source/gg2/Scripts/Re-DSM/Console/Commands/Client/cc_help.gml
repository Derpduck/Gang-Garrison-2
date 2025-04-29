console_addCommand('help', '
if (arg[0] == 0)
{
    // List all available commands
    var commandList, commandString, key;
    commandList = ds_list_create();
    commandString = "";
    key = ds_map_find_first(global.consoleCommandMap);
    
    // Put all commands in a list and sort them
    for (iMap=0; iMap<ds_map_size(global.consoleCommandMap); iMap+=1)
    {
        ds_list_add(commandList, string(key));
        key = ds_map_find_next(global.consoleCommandMap, key);
    };
    ds_list_sort(commandList, true);
    
    // Make list into a string
    for (iList=0; iList<ds_list_size(commandList); iList+=1)
    {
        commandString += string(ds_list_find_value(commandList, iList)) + ", ";
    };
    
    console_print(COL_ORANGE + string_copy(commandString, 1, string_length(commandString) - 2));
    console_print(COL_ORANGE + "For help with a specific command, type " + chr(39) + "help <command name>" + chr(39));
}
else
{
    var command;
    command = string_lower(arg[1]);
    
    // Print documentation for given command
    if (ds_map_exists(global.consoleCommandMapHelp, command))
    {
        execute_string(ds_map_find_value(global.consoleCommandMapHelp, command));
    }
    else
    {
        console_print(COL_RED + "[ERROR] Unknown command: " + command);
    }
}
', '
console_print("Syntax: help <command>");
console_print("Try entering help once, not twice.");
');
