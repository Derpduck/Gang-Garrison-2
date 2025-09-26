console_add_command('ban', '
if (console_validate_args(1, arg[0], "ban <player>") == false) exit;

var player;
player = console_get_player(arg[1]);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + COL_YELLOW + arg[1], rconPlayer);
    break;
}
else
{
    if (ban_user(player, 0))
    {
        console_print(console_get_player_name(player) + COL_ORANGE + " was banned", rconPlayer);
    }
    else
    {
        // This should never be possible
        console_print(console_get_player_name(player) + COL_ORANGE + " is already banned", rconPlayer);
    }
    
    ban_write_to_file(player);
    player.kicked = true;
}
', '
console_print(COL_ORANGE + "Syntax: ban <player>");
console_print(COL_ORANGE + "Bans the given player from the server permanently");
', console_init_access_level('ban', CC_HOST));
