console_add_command('gib', '
if (console_validate_args(1, arg[0], "gib <player>") == false) exit;

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
        sendEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF_GIB);
        doEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF_GIB);
        player.alarm[5] = global.Server_Respawntime / global.delta_factor;
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " was gibbed");
    }
    else
    {
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " is not alive");
    }
}
', '
console_print(COL_ORANGE + "Syntax: gib <player>");
console_print(COL_ORANGE + "Kills the given player with a gib explosion");
', console_init_access_level('gib', CC_HOST_RCON));
