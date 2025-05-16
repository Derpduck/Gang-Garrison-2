// Remove bind from file and map
var bindKey;
bindKey = argument0;

if (ds_map_exists(global.bindsMap, bindKey))
{
    // Remove the bind from key map
    ds_map_delete(global.bindsMap, bindKey);
    
    // We can't remove a specific line, so delete and re-create the file
    if (file_exists(working_directory + "\DSM\Binds.txt"))
    {
        file_delete(working_directory + "\DSM\Binds.txt");
        
        var fileHandle, bindsMapKey;
        fileHandle = file_text_open_write(working_directory + "\DSM\Binds.txt");
        bindsMapKey = ds_map_find_first(global.bindsMap);
        
        // Save all remaining binds to the new file
        for (i=0; i<ds_map_size(global.bindsMap); i+=1)
        {
            file_text_write_string(fileHandle, string(bindsMapKey) + "{@}" + ds_map_find_value(global.bindsMap, bindsMapKey));
            file_text_writeln(fileHandle);
            
            bindsMapKey = ds_map_find_next(global.bindsMap, bindsMapKey);
        };
        
        file_text_close(fileHandle);
    }
}
