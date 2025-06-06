console_add_command('kill', '
if (console_validate_args(1, arg[0], "kill <player>") == false) exit;

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
        sendEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF);
        doEventPlayerDeath(player, noone, noone, DAMAGE_SOURCE_FINISHED_OFF);
        player.alarm[5] = global.Server_Respawntime / global.delta_factor;
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " was killed");
    }
    else
    {
        console_print(get_team_color_code(player.team) + player.name + COL_ORANGE + " is not alive");
    }
}
', '
console_print(COL_ORANGE + "Syntax: kill <player>");
console_print(COL_ORANGE + "Kills the given player");
', console_init_access_level('kill', CC_HOST_RCON));
