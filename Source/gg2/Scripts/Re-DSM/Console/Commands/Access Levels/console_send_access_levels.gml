var player;
player = argument0;

// Feature not supported for clients below v6
if (player.dsmClientVersion < 6)
    exit

// Inform clients of any commands where the access level has been changed from the default
var commandMapKey, commandAccessLevel, defaultAccessLevel;
commandMapKey = ds_map_find_first(global.consoleCommandMap);

for (i=0; i<ds_map_size(global.consoleCommandMap); i+=1)
{
    commandAccessLevel = ds_map_find_value(global.consoleCommandMapRules, commandMapKey);
    defaultAccessLevel = ds_map_find_value(global.consoleCommandMapRulesDefault, commandMapKey);
    
    if (commandAccessLevel != CC_CLIENT and commandAccessLevel != defaultAccessLevel)
    {
        write_ubyte(player.socket, DSM_ACCESS_LEVELS);
        write_ubyte(player.socket, commandAccessLevel);
        write_ubyte(player.socket, string_length(commandMapKey));
        write_string(player.socket, commandMapKey);
    }
    
    commandMapKey = ds_map_find_next(global.consoleCommandMap, commandMapKey);
};
