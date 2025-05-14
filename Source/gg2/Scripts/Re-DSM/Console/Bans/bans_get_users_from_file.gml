// Get all banned users from file, create a file if it doesn't exist
global.bannedSavedUsers = ds_map_create();

if (file_exists(working_directory + "\DSM\Banned_Users.txt"))
{
    var bansFile, banLine, banIP, banName;
    bansFile = file_text_open_read(working_directory + "\DSM\Banned_Users.txt");
    
    while !file_text_eof(bansFile)
    {
        banLine = file_text_read_string(bansFile);
        banIP = string_copy(banLine, 1, string_pos("@", banLine) - 1);
        banName = string_copy(banLine, string_pos("@", banLine) + 1, string_length(banLine));
        
        if (!ds_map_exists(global.bannedSavedUsers, banIP))
        {
            ds_map_add(global.bannedSavedUsers, banIP, banName);
        }
        
        if (!ds_map_exists(global.bannedUsers, banIP))
        {
            ds_map_add(global.bannedUsers, banIP, banName);
        }
        
        file_text_readln(bansFile)
    }
    
    file_text_close(bansFile);
}
