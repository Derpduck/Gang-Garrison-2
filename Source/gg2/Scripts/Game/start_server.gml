//Server respawn time calculator. Converts each second to a frame. (read: multiply by 30 :hehe:)
if (string_length(global.serverPluginList) > 254)
{
    show_notification_message("Error: Server plugin list cannot exceed 254 characters");
}
else
{
    if (global.Server_RespawntimeSec == 0)
        global.Server_Respawntime = 1;
    else
        global.Server_Respawntime = global.Server_RespawntimeSec * 30;
    
    global.gameServer = instance_create(0,0,GameServer);
}
