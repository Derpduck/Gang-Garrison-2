// Get all saved RCON users from file, create a file if it doesn't exist
global.rconSavedUsers = ds_map_create();

if (global.rconEnabled)
{
    if (file_exists(working_directory + "\DSM\RCON_Users.txt"))
    {
        var fileHandle, currentLine, rconIP, rconName;
        fileHandle = file_text_open_read(working_directory + "\DSM\RCON_Users.txt");
        
        while !file_text_eof(fileHandle)
        {
            currentLine = file_text_read_string(fileHandle);
            
            // Skip invalid lines
            if (string_length(currentLine) <= 1 or string_pos("@", currentLine) == 0)
            {
                file_text_readln(fileHandle);
                continue;
            }
            
            rconIP = string_copy(currentLine, 1, string_pos("@", currentLine) - 1);
            rconName = string_copy(currentLine, string_pos("@", currentLine) + 1, string_length(currentLine));
            
            if (!ds_map_exists(global.rconSavedUsers, rconIP))
            {
                ds_map_add(global.rconSavedUsers, rconIP, rconName);
            }
            
            file_text_readln(fileHandle);
        }
        
        file_text_close(fileHandle);
    }
}
