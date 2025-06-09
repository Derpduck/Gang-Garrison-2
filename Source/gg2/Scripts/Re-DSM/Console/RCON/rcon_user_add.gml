// Grants RCON access to the user
var player;
player = argument0;

if (player.dsmClientVersion >= 0)
{
    write_ubyte(player.socket, DSM_RCON_LOGIN);
    write_ubyte(player.socket, RCON_LOGIN_SUCCESS);
}


console_send_access_levels(player);

if (ds_list_find_index(global.rconUsers, player) == -1)
{
    ds_list_add(global.rconUsers, player);
    return true;
}
else
{
    return false;
}
