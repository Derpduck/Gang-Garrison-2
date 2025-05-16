// Remove RCON user from file
var player, playerIP;
player = argument0;
playerIP = socket_remote_ip(player.socket);

if (global.saveRconUsers)
{
    if (ds_map_exists(global.rconSavedUsers, playerIP))
    {
        // Remove the user from RCON map
        ds_map_delete(global.rconSavedUsers, playerIP);
        
        // We can't remove a specific line, so delete and re-create the file
        if (file_exists(working_directory + "\DSM\RCON_Users.txt"))
        {
            file_delete(working_directory + "\DSM\RCON_Users.txt");
            
            var fileHandle, rconMapKey;
            fileHandle = file_text_open_write(working_directory + "\DSM\RCON_Users.txt");
            rconMapKey = ds_map_find_first(global.rconSavedUsers);
            
            // Save all remaining users to the new file
            for (i=0; i<ds_map_size(global.rconSavedUsers); i+=1)
            {
                file_text_write_string(fileHandle, string(rconMapKey) + "@" + ds_map_find_value(global.rconSavedUsers, rconMapKey));
                file_text_writeln(fileHandle);
                
                rconMapKey = ds_map_find_next(global.rconSavedUsers, rconMapKey);
            };
            
            file_text_close(fileHandle);
        }
    }
}
