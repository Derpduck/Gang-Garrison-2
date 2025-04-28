// Check if joining player has RCON access (or is the host), and give RCON if so
var player;
player = argument0;
playerIP = socket_remote_ip(player.socket);

if (global.rconEnabled)
{
    if (ds_map_find_value(global.rconSavedUsers, playerIP) != -1 or playerIP == "127.0.0.1" or playerIP == "::1")
    {
        rcon_user_login(player);
        console_print(COL_ORANGE + "[RCON LOGIN] " + player.name + " joined and was given RCON access");
    }
}
