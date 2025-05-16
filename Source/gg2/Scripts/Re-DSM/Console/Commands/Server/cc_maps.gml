// TODO: Fix erroneously displayed console maps when used during a map change
console_add_command('maps', '
for (i=0; i<ds_list_size(global.map_rotation); i+=1)
{
    if (i == GameServer.currentMapIndex)
    {
        // Current map
        if (ds_list_find_value(global.map_rotation, i) != global.currentMap)
        {
            // Current map has been manually changed to by console
            console_print(COL_ORANGE + string(i + 1) + ": " + ds_list_find_value(global.map_rotation, i));
            console_print(COL_ORANGE + "CON: " + COL_GREEN + global.currentMap + COL_YELLOW + " [CURRENT MAP]");
        }
        else
        {
            // Highlight current map
            console_print(COL_ORANGE + string(i + 1) + ": " + COL_GREEN + ds_list_find_value(global.map_rotation, i) + COL_YELLOW + " [CURRENT MAP]");
        }
    }
    else
    {
        if (i == GameServer.currentMapIndex + 1)
        {
            // Next map
            if (global.nextMap != global.currentMap or global.consoleMapChangeQueued)
            {
                // Next map has been manually set by console
                console_print(COL_ORANGE + "CON: " + global.nextMap);
            }
        }
        
        // Any other maps in the rotation
        console_print(COL_ORANGE + string(i + 1) + ": " + ds_list_find_value(global.map_rotation, i));
    }
};
', '
console_print(COL_ORANGE + "Syntax: maps ");
console_print(COL_ORANGE + "Prints the current map rotation order");
', CC_HOST);
