var player, colorOverride, playerID, playerName, playerTeamColor;
player = argument0;
colorOverride = string(argument1);
playerID = ds_list_find_index(global.players, player);
playerName = player.name;

if (string_length(colorOverride) > 1)
    playerTeamColor = colorOverride;
else
    playerTeamColor = get_team_color_code(player.team);
    

if (global.consolePlayerID)
    return playerTeamColor + "[" + string(playerID) + "] " + playerName;
else
    return playerTeamColor + playerName;
