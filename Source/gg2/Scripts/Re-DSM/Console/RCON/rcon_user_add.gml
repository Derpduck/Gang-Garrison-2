var player;
player = argument0;

write_ubyte(player.socket, DSM_RCON_LOGIN);
write_ubyte(player.socket, 1);

if (ds_list_find_index(global.rconUsers, player) == -1)
{
    ds_list_add(global.rconUsers, player);
}
