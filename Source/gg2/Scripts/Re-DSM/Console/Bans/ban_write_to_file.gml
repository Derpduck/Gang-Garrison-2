// Save banned user to file
var player, playerIP;
player = argument0;
playerIP = socket_remote_ip(player.socket);

if (!ds_map_exists(global.bannedSavedUsers, playerIP))
{
    ds_map_add(global.bannedSavedUsers, playerIP, player.name);
}
    
var bansFile;
bansFile = file_text_open_write(working_directory + "\DSM\Banned_Users.txt");
file_text_write_string(bansFile, string(playerIP) + "@" + player.name);
file_text_writeln(bansFile);
file_text_close(bansFile);
