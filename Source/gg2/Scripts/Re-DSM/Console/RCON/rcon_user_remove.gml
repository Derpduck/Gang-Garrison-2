// Removes RCON access from the user
var player;
player = argument0;

if (player.isDSMClient)
{
    write_ubyte(player.socket, DSM_RCON_LOGIN);
    write_ubyte(player.socket, RCON_LOGIN_REMOVED);
}

if (ds_list_find_index(global.rconUsers, player) != -1)
{
    ds_list_delete(global.rconUsers, ds_list_find_index(global.rconUsers, player));
    return true;
}
else
{
    return false;
}
