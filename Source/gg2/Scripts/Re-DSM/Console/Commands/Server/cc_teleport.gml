console_add_command('teleport', '
if (console_validate_args(1, arg[0], "teleport <player>") == false) exit;

var player;
player = console_get_player(arg[1], true);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + COL_YELLOW + arg[1]);
    break;
}
else
{
    if (player.object != -1)
    {
        player.object.x = mouse_x;
        player.object.y = mouse_y;
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " was teleported to: " + COL_YELLOW + string(mouse_x) + "," + string(mouse_y));
    }
    else
    {
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " is not alive");
    }
}
', '
console_print(COL_ORANGE + "Syntax: teleport <player>");
console_print(COL_ORANGE + "Teleports the given player to the current cursor position");
', CC_HOST);
