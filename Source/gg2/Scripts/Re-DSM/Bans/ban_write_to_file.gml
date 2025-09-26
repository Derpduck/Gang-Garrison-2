// Save banned user to file
var player, playerIP;
player = argument0;
playerIP = socket_remote_ip(player.socket);

if (!ds_map_exists(global.bannedSavedUsers, playerIP))
{
    ds_map_add(global.bannedSavedUsers, playerIP, player.name);
}

// Get bans file
var fileHandle;
fileHandle = file_text_open_append(working_directory + "\DSM\Banned_Users.txt");

// Write to file
file_text_write_string(fileHandle, string(playerIP) + "@" + player.name);
file_text_writeln(fileHandle);
file_text_close(fileHandle);
