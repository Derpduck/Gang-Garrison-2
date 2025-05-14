// Loads a new map rotation while the server is currently active
var rotationFile;
rotationFile = argument0;
shuffle = argument1;

if (rotationFile != "" and file_exists(rotationFile))
{
    // Clear the current map rotation
    ds_list_clear(global.map_rotation);
    GameServer.currentMapIndex = -1;
    global.mapRotationFile = rotationFile;
    
    var fileHandle, i, mapname;
    fileHandle = file_text_open_read(global.mapRotationFile);
    for (i = 1; !file_text_eof(fileHandle); i += 1)
    {
        mapname = trim(file_text_read_string(fileHandle));
        if (mapname != "" and string_char_at(mapname, 0) != "#") // if it's not blank and it's not a comment (starting with #)
        {
            ds_list_add(global.map_rotation, mapname);
        }
        file_text_readln(fileHandle);
    }
    file_text_close(fileHandle);
    
    if (shuffle)
        ds_list_shuffle(global.map_rotation);
    
    return true;
}
else
{
    // Given map rotation doesn't exist
    return false;
}
