console_add_command('team', '
if (console_validate_args(2, arg[0], "team <player> <new team>") == false) exit;

var player;
player = console_get_player(arg[1], true);
if (player == -1)
{
    console_print(COL_RED + "[ERROR] Invalid player: " + COL_YELLOW + arg[1]);
    break;
}
else
{
    var newTeam, oldTeam;
    newTeam = get_team_from_string(arg[2]);
    oldTeam = player.team;
    
    if (newTeam == -1)
    {
        console_print(COL_RED + "[ERROR] Invalid team: " + COL_YELLOW + arg[2]);
        exit;
    }
    
    if (oldTeam == newTeam)
    {
        console_print(get_team_color_code(oldTeam) + player.name + COL_ORANGE + " is already on team: " + get_team_color_code(newTeam) + get_team_string(newTeam));
        exit;
    }
    
    if (change_player_team(player, newTeam, true))
    {
        console_print(get_team_color_code(oldTeam) + player.name + COL_ORANGE + " was moved to team: " + get_team_color_code(newTeam) + get_team_string(newTeam));
    }
    else
    {
        console_print(COL_ORANGE + "Unable to move :" + get_team_color_code(oldTeam) + player.name + COL_ORANGE + " to team: " + get_team_color_code(newTeam) + get_team_string(newTeam));
    }
}
', '
console_print(COL_ORANGE + "Syntax: team <player> <new team>");
console_print(COL_ORANGE + "Changes the given player" + SINGLE_QUOTE + "s team to the given team, ignoring team balance");
', CC_HOST_RCON);
