console_add_command('kick', '
if (console_validate_args(1, arg[0], "kick <player>") == false) exit;

var player;
player = console_get_player(arg[1]);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + COL_YELLOW + arg[1]);
    break;
}
else
{
    write_ubyte(player.socket, KICK);
    write_ubyte(player.socket, DSM_KICK_ADMIN);
    player.kicked = true;
    console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " was kicked");
}
', '
console_print(COL_ORANGE + "Syntax: kick <player>");
console_print(COL_ORANGE + "Kicks the given player from the server");
', console_init_access_level('kick', CC_HOST_RCON));
