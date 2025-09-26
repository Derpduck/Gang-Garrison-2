console_add_command('team', '
if (console_validate_args(2, arg[0], "team <player> <new team>") == false) exit;

var player;
player = console_get_player(arg[1], true);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + COL_YELLOW + arg[1], rconPlayer);
    break;
}
else
{
    var newTeam, oldTeam;
    newTeam = get_team_from_string(arg[2]);
    oldTeam = player.team;
    
    if (newTeam == -1)
    {
        console_print(COL_RED + "[ERROR] Invalid team: " + COL_YELLOW + arg[2], rconPlayer);
        exit;
    }
    
    if (oldTeam == newTeam)
    {
        console_print(console_get_player_name(player, get_team_color_code(oldTeam)) + COL_ORANGE + " is already on team: " + get_team_color_code(newTeam) + get_team_string(newTeam), rconPlayer);
        exit;
    }
    
    if (change_player_team(player, newTeam, true))
    {
        console_print(console_get_player_name(player, get_team_color_code(oldTeam)) + COL_ORANGE + " was moved to team: " + get_team_color_code(newTeam) + get_team_string(newTeam), rconPlayer);
    }
    else
    {
        console_print(COL_ORANGE + "Unable to move :" + console_get_player_name(player, get_team_color_code(oldTeam)) + COL_ORANGE + " to team: " + get_team_color_code(newTeam) + get_team_string(newTeam), rconPlayer);
    }
}
', '
console_print(COL_ORANGE + "Syntax: team <player> <new team>");
console_print(COL_ORANGE + "Changes the given player" + SINGLE_QUOTE + "s team to the given team, ignoring team balance");
', console_init_access_level('team', CC_HOST_RCON));
