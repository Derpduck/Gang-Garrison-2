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
        
    var rconFile;
    rconFile = file_text_open_write(working_directory + "\DSM\RCON_Users.txt");
    file_text_write_string(rconFile, string(playerIP) + "@" + player.name);
    file_text_writeln(rconFile);
    file_text_close(rconFile);
}
