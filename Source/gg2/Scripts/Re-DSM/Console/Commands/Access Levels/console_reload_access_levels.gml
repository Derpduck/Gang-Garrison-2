ini_open("Re-DSM.ini");
var commandMapKey, commandAccessLevel, defaultAccessLevel;
commandMapKey = ds_map_find_first(global.consoleCommandMap);

for (i=0; i<ds_map_size(global.consoleCommandMap); i+=1)
{
    defaultAccessLevel = ds_map_find_value(global.consoleCommandMapRulesDefault, commandMapKey);
    ds_map_replace(global.consoleCommandMapRules, commandMapKey, ini_read_real("Command Access Level", commandMapKey, defaultAccessLevel));
    
    commandMapKey = ds_map_find_next(global.consoleCommandMap, commandMapKey);
};
ini_close();
