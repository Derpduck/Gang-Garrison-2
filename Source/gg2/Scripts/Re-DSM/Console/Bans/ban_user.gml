// Adds a user to the banned list
// banType: 0 = permanent, 1 = temporary

var player, playerIP, banType;
player = argument0;
playerIP = socket_remote_ip(player.socket);
banType = argument1;

write_ubyte(player.socket, KICK);
if (banType == 0)
    write_ubyte(player.socket, DSM_KICK_BAN);
else
    write_ubyte(player.socket, DSM_KICK_TEMP_BAN);

if (ds_list_find_index(global.bannedUsers, playerIP) == -1)
{
    ds_list_add(global.bannedUsers, playerIP);
    return true;
}
else
{
    return false;
}
