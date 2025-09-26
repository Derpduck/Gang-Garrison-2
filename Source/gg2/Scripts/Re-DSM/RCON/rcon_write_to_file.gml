// Save RCON user to file
var player, playerIP;
player = argument0;
playerIP = socket_remote_ip(player.socket);

if (global.saveRconUsers)
{
    if (!ds_map_exists(global.rconSavedUsers, playerIP))
    {
        ds_map_add(global.rconSavedUsers, playerIP, player.name);
    }
    
    // Get RCON file
    var fileHandle;
    fileHandle = file_text_open_append(working_directory + "\DSM\RCON_Users.txt");
    
    // Write to file
    file_text_write_string(fileHandle, string(playerIP) + "@" + player.name);
    file_text_writeln(fileHandle);
    file_text_close(fileHandle);
}
