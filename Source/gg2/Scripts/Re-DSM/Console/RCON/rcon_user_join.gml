// Check if joining player has RCON access (or is the host), and give RCON if so
var player;
player = argument0;
playerIP = socket_remote_ip(player.socket);

if (global.rconEnabled and player.isDSMClient)
{
    if (ds_map_exists(global.rconSavedUsers, playerIP) or playerIP == "127.0.0.1" or playerIP == "::1")
    {
        rcon_user_add(player);
        console_print(COL_PINK + "[RCON LOGIN] " + player.name + " joined and was given RCON access");
    }
}
