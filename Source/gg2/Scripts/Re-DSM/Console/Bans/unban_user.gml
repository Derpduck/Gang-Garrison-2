// Removes a banned IP from the bans list
var playerIP;
playerIP = argument0;

if (ds_list_find_index(global.bannedUsers, playerIP) != -1)
{
    ds_list_delete(global.bannedUsers, ds_list_find_index(global.bannedUsers, playerIP));
    return true;
}
else
{
    return false;
}
