// TODO: Add option to print all bindable virtual keys
console_add_command('binds', '

var bindsMapKey;
bindsMapKey = ds_map_find_first(global.bindsMap);
console_print(COL_ORANGE + string(ds_map_size(global.bindsMap)) + " bind(s) found")

for (i=0; i<ds_map_size(global.bindsMap); i+=1)
{
    var command;
    command = ds_map_find_value(global.bindsMap, bindsMapKey);
    
    console_print(COL_ORANGE + "Key: " + COL_WHITE + bindsMapKey + COL_ORANGE + " | Command: " + COL_WHITE + command);
    
    bindsMapKey = ds_map_find_next(global.bindsMap, bindsMapKey);
};
', '
console_print(COL_ORANGE + "Syntax: binds");
console_print(COL_ORANGE + "Prints all saved binds");
', CC_CLIENT);
