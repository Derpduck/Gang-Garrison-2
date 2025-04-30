console_add_command('help', '
if (arg[0] == 0)
{
    // List all available commands
    var commandString;
    commandString = "";
    
    // Make list into a string
    for (i=0; i<ds_list_size(global.consoleCommandList); i+=1)
    {
        commandString += string(ds_list_find_value(global.consoleCommandList, i)) + ", ";
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
', 0);
