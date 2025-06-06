console_add_command('tempban', '
if (console_validate_args(1, arg[0], "tempban <player>") == false) exit;

var player;
player = console_get_player(arg[1]);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + COL_YELLOW + arg[1]);
    break;
}
else
{
    if (ban_user(player, 1))
    {
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " was temporarily banned");
    }
    else
    {
        // This should never be possible
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " is already banned");
    }
    
    player.kicked = true;
}
', '
console_print(COL_ORANGE + "Syntax: tempban <player>");
console_print(COL_ORANGE + "Bans the given player from the server for the current session");
', console_init_access_level('tempban', CC_HOST_RCON));
