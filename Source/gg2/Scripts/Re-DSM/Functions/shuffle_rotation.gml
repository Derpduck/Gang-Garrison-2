var map, i;
if (global.shuffleRotation or argument0) {
    ds_list_shuffle(global.map_rotation);
    map = ds_list_find_value(global.map_rotation, 0);
    // "Shuffle, don't make arena map first" chosen
    if (global.shuffleRotation == 1) {
        // if first map is arena
        if (string_copy(map, 0, 6) == 'arena_') {
            // try to find something else
            for (i = 0; i < ds_list_size(global.map_rotation); i += 1) {
                map = ds_list_find_value(global.map_rotation, i);
                // swap with first map
                if (string_copy(map, 0, 6) != 'arena_') {
                    ds_list_replace(global.map_rotation, i, ds_list_find_value(global.map_rotation, 0));
                    ds_list_replace(global.map_rotation, 0, map);
                }
            }
        }
    }
    
    return true;
}

return false;
