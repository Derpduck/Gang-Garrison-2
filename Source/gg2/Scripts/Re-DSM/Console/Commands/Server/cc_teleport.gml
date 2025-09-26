console_add_command('teleport', '
if (console_validate_args(1, arg[0], "teleport <player>") == false) exit;

var player;
player = console_get_player(arg[1], true);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + COL_YELLOW + arg[1], rconPlayer);
    break;
}
else
{
    if (player.object != -1)
    {
        player.object.x = mouse_x;
        player.object.y = mouse_y;
        console_print(console_get_player_name(player) + COL_ORANGE + " was teleported to: " + COL_YELLOW + string(mouse_x) + "," + string(mouse_y), rconPlayer);
    }
    else
    {
        console_print(console_get_player_name(player) + COL_ORANGE + " is not alive", rconPlayer);
    }
}
', '
console_print(COL_ORANGE + "Syntax: teleport <player>");
console_print(COL_ORANGE + "Teleports the given player to the current cursor position");
', console_init_access_level('teleport', CC_HOST));
