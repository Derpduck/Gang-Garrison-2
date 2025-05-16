// Get all saved binds from file, create a file if it doesn't exist
if (file_exists(working_directory + "\DSM\Binds.txt"))
{
    var fileHandle, currentLine, bindKey, bindCommand;
    fileHandle = file_text_open_read(working_directory + "\DSM\Binds.txt");
    
    while !file_text_eof(fileHandle)
    {
        currentLine = file_text_read_string(fileHandle);
        
        // Skip invalid lines
        if (string_length(currentLine) <= 1 or string_pos("{@}", currentLine) == 0)
        {
            file_text_readln(fileHandle);
            continue;
        }
        
        bindKey = string_copy(currentLine, 1, string_pos("{@}", currentLine) - 1);
        bindCommand = string_copy(currentLine, string_pos("{@}", currentLine) + 3, string_length(currentLine));
        
        if (!ds_map_exists(global.bindsMap, bindKey))
        {
            ds_map_add(global.bindsMap, bindKey, bindCommand);
        }
        
        file_text_readln(fileHandle);
    }
    
    file_text_close(fileHandle);
}
