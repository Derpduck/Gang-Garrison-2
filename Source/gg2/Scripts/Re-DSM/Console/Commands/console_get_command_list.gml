// Get list of all available console commands in alphabetical order
// Ensure list is destroyed in the code calling this script
var commandMapKey;
commandMapKey = ds_map_find_first(global.consoleCommandMap);

// Put all commands in a list and sort them
for (i=0; i<ds_map_size(global.consoleCommandMap); i+=1)
{
    ds_list_add(global.consoleCommandList, string(commandMapKey));
    commandMapKey = ds_map_find_next(global.consoleCommandMap, commandMapKey);
};

ds_list_sort(global.consoleCommandList, true);
