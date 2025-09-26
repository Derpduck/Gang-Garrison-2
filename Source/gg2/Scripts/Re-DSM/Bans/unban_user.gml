// Removes a banned IP from the bans list
var playerIP;
playerIP = argument0;

if (ds_map_exists(global.bannedUsers, playerIP))
{
    ds_map_delete(global.bannedUsers, playerIP);
    return true;
}
else
{
    return false;
}
