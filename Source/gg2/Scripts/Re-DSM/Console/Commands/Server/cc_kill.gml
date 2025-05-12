console_add_command('kill', '
if (console_validate_args(1, arg[0], "kill <player>") == false) exit;

var player;
player = console_get_player(arg[1], true);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + arg[1]);
    break;
}
else
{
    sendEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF);
    doEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF);
    console_print(get_team_color_code(player) + player.name + COL_ORANGE + " was killed");
}
', '
console_print(COL_ORANGE + "Syntax: kill <player>");
console_print(COL_ORANGE + "Kills the given player");
', CC_HOST_RCON);
