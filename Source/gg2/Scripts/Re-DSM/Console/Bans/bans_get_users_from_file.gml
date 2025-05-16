// Get all banned users from file, create a file if it doesn't exist
global.bannedSavedUsers = ds_map_create();

if (file_exists(working_directory + "\DSM\Banned_Users.txt"))
{
    var fileHandle, currentLine, banIP, banName;
    fileHandle = file_text_open_read(working_directory + "\DSM\Banned_Users.txt");
    
    while !file_text_eof(fileHandle)
    {
        currentLine = file_text_read_string(fileHandle);
        
        // Skip invalid lines
        if (string_length(currentLine) <= 1 or string_pos("@", currentLine) == 0)
        {
            file_text_readln(fileHandle);
            continue;
        }
        
        banIP = string_copy(currentLine, 1, string_pos("@", currentLine) - 1);
        banName = string_copy(currentLine, string_pos("@", currentLine) + 1, string_length(currentLine));
        
        if (!ds_map_exists(global.bannedSavedUsers, banIP))
        {
            ds_map_add(global.bannedSavedUsers, banIP, banName);
        }
        
        if (!ds_map_exists(global.bannedUsers, banIP))
        {
            ds_map_add(global.bannedUsers, banIP, banName);
        }
        
        file_text_readln(fileHandle);
    }
    
    file_text_close(fileHandle);
}
