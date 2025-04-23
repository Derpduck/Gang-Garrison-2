// Loads a console command
// Can be used by plugins to add console commands
var commandName, commandCode, commandHelp, commandRule;
commandName = argument0;
commandCode = argument1;
commandHelp = argument2;
commandRules = argument3;

ds_map_add(global.consoleCommands, commandName, console_get_rules(commandRules) + commandCode);

if (argument2 != "")
{
    ds_map_add(global.consoleCommandsHelp, commandName, commandHelp);
}
else
{
    ds_map_add(global.consoleCommandsHelp, commandName, "This command does not have valid documentation.");
}
