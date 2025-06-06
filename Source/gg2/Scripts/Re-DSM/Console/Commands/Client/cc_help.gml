console_add_command('help', '
if (console_validate_args(1, arg[0], "help <command>", true) == false)
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
    console_print(COL_ORANGE + "For help with a specific command, use: " + COL_YELLOW + "help <command name>");
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
        if (command == "me")
            console_print(COL_ORANGE + "Won" + SINGLE_QUOTE + "t you please, please help me")
        else
            console_print(COL_RED + "[ERROR] Unknown command: " + COL_YELLOW + command);
    }
}
', '
console_print(COL_ORANGE + "Syntax: help <command>");
console_print(COL_ORANGE + "Prints documentation for the given command");
', console_init_access_level('help', CC_CLIENT));
