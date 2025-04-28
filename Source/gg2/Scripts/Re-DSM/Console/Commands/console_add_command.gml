// Loads a console command
// Can be used by plugins to add console commands
var commandName, commandCode, commandHelp, commandRule;
commandName = string_lower(argument0);
commandCode = argument1;
commandHelp = argument2;
commandRule = argument3;

// Command Code
ds_map_add(global.consoleCommandMap, commandName, commandCode);

// Command Help
if (commandHelp != "")
{
    ds_map_add(global.consoleCommandMapHelp, commandName, commandHelp);
}
else
{
    ds_map_add(global.consoleCommandMapHelp, commandName, "This command does not have valid documentation.");
}

// Command Rules
ds_map_add(global.consoleCommandMapRules, commandName, commandRule);
