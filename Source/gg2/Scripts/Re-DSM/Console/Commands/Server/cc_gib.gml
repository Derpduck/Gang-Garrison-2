console_add_command('gib', '
if (console_validate_args(1, arg[0], "gib <player>") == false) exit;

var player;
player = console_get_player(arg[1], true);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + arg[1]);
    break;
}
else
{
    sendEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF_GIB);
    doEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF_GIB);
    console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " was gibbed");
}
', '
console_print(COL_ORANGE + "Syntax: gib <player>");
console_print(COL_ORANGE + "Kills the given player with a gib explosion");
', CC_HOST_RCON);
