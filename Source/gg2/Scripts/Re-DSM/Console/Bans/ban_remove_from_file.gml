// Remove banned user from file
var playerIP;
playerIP = argument0;

if (ds_map_exists(global.bannedSavedUsers, playerIP))
{
    // Remove the user from banned map
    ds_map_delete(global.bannedSavedUsers, playerIP);
    
    // We can't remove a specific line, so delete and re-create the file
    if (file_exists(working_directory + "\DSM\Banned_Users.txt"))
    {
        file_delete(working_directory + "\DSM\Banned_Users.txt");
        
        var bansFile, banMapKey;
        bansFile = file_text_open_write(working_directory + "\DSM\Banned_Users.txt");
        banMapKey = ds_map_find_first(global.bannedSavedUsers);
        
        // Save all remaining users to the new file
        for (i=0; i<ds_map_size(global.bannedSavedUsers); i+=1)
        {
            file_text_write_string(bansFile, string(banMapKey) + "@" + ds_map_find_value(global.bannedSavedUsers, banMapKey));
            file_text_writeln(bansFile);
            
            banMapKey = ds_map_find_next(global.bannedSavedUsers, banMapKey);
        };
        
        file_text_close(bansFile);
    }
    
    return true;
}
else
{
    return false;
}
