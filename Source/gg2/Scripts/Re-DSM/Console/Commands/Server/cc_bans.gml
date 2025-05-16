console_add_command('bans', '
var banMapKey;
banMapKey = ds_map_find_first(global.bannedUsers);
console_print(COL_YELLOW + string(ds_map_size(global.bannedUsers)) + COL_ORANGE + " player(s) currently banned")

for (i=0; i<ds_map_size(global.bannedUsers); i+=1)
{
    var playerName, ipSpaces, isTempBan;
    playerName = ds_map_find_value(global.bannedUsers, banMapKey);
    ipSpaces = string_repeat(" ", 15 - string_length(banMapKey));
    
    if (!ds_map_exists(global.bannedSavedUsers, banMapKey))
        isTempBan = " [TEMP BAN]";
    else
        isTempBan = "";
    
    console_print(COL_ORANGE + "IP: " + COL_WHITE + banMapKey + ipSpaces + COL_ORANGE + " | " + COL_WHITE + playerName + isTempBan);
    
    banMapKey = ds_map_find_next(global.bannedUsers, banMapKey);
};
', '
console_print(COL_ORANGE + "Syntax: bans");
console_print(COL_ORANGE + "Prints a list of all banned players");
', CC_HOST);
