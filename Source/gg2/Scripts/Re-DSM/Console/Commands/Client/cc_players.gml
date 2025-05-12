console_add_command('players', '
// ID  |  Name  [RCON]
console_print(COL_ORANGE + string(ds_list_size(global.players)) + " player(s) currently connected")
for (i=0; i<ds_list_size(global.players); i+=1)
{
    var player, playerID, idSpaces, isRCON;
    player = ds_list_find_value(global.players, i);
    
    if (instance_exists(player))
    {
        playerID = string(ds_list_find_index(global.players, player));
        idSpaces = string_repeat(" ", 2 - string_length(playerID));
        isRCON = "";
        
        // Only hosts can see RCON users
        if (global.isHost)
            if (ds_list_find_index(global.rconUsers, player) != -1)
                isRCON = COL_PINK + " [RCON]"
            
        
        console_print(COL_ORANGE + "ID: " + COL_WHITE + playerID + idSpaces + COL_ORANGE + " | " + get_team_color_code(player) + player.name + isRCON);
    }
};
', '
console_print(COL_ORANGE + "Syntax: players");
console_print(COL_ORANGE + "Prints a list of all players on the server and their ID numbers");
', CC_CLIENT);
