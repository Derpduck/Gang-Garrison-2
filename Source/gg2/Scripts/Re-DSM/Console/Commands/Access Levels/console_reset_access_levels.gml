var commandMapKey, commandAccessLevel, defaultAccessLevel;
commandMapKey = ds_map_find_first(global.consoleCommandMap);

for (i=0; i<ds_map_size(global.consoleCommandMap); i+=1)
{
    commandAccessLevel = ds_map_find_value(global.consoleCommandMapRules, commandMapKey);
    defaultAccessLevel = ds_map_find_value(global.consoleCommandMapRulesDefault, commandMapKey);
    
    if (commandAccessLevel != CC_CLIENT and commandAccessLevel != defaultAccessLevel)
    {
        ds_map_replace(global.consoleCommandMapRules, commandMapKey, defaultAccessLevel);
    }
    
    commandMapKey = ds_map_find_next(global.consoleCommandMap, commandMapKey);
};
