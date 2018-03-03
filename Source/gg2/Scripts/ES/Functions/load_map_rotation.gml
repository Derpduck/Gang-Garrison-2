if room!=Gang_Garrison_2{
    ds_list_destroy(global.map_rotation)
}
global.map_rotation = ds_list_create();

global.customMapdesginated = 0

// if the user defined a valid map rotation file, then load from there
if(global.mapRotationFile != "" && file_exists(global.mapRotationFile) && global.launchMap == ""){
    global.customMapdesginated = 1
    var fileHandle, i, mapname;
    fileHandle = file_text_open_read(global.mapRotationFile)
    for(i = 1; !file_text_eof(fileHandle); i += 1){
        mapname = file_text_read_string(fileHandle)
        // remove leading whitespace from the string
        while(string_char_at(mapname, 0) == " " || string_char_at(mapname, 0) == chr(9)){ // while it starts with a space or tab
            mapname = string_delete(mapname, 0, 1) // delete that space or tab
        }
        if(mapname != "" && string_char_at(mapname, 0) != "#"){ // if it's not blank and it's not a comment (starting with #)
            ds_list_add(global.map_rotation, mapname)
        }
        file_text_readln(fileHandle)
    }
    file_text_close(fileHandle)
}else if (global.launchMap != "") && (global.dedicatedMode == 1){
    ds_list_add(global.map_rotation, global.launchMap)
}

var map, i;
if (global.shuffleRotation) {
    if global.shuffleRotation==3{
        with(ModController){
            alarm[0]=20/global.delta_factor
        }
    }else{
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
    }
}
