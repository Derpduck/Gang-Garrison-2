console_add_command('end', '
if (console_validate_args(1, arg[0], "end <team>", true) == false)
{
    global.winners = TEAM_SPECTATOR;
    console_print(COL_ORANGE + "Round has been ended, next map: " + COL_YELLOW + get_next_map());
}
else
{
    var winningTeam;
    winningTeam = get_team_from_string(arg[1]);
    
    if (winningTeam == TEAM_RED)
    {
        global.winners = winningTeam;
        console_print(COL_ORANGE + "Round has been ended, " + COL_RED_LT + "RED Team" + COL_ORANGE + " wins, next map: " + COL_YELLOW + get_next_map());
    }
    else if (winningTeam == TEAM_BLUE)
    {
        global.winners = winningTeam;
        console_print(COL_ORANGE + "Round has been ended, " + COL_BLUE_LT + "BLUE Team" + COL_ORANGE + " wins, next map: " + COL_YELLOW + get_next_map());
    }
    else
    {
        global.winners = TEAM_SPECTATOR;
        console_print(COL_ORANGE + "Round has been ended, next map: " + COL_YELLOW + get_next_map());
    }
}
', '
console_print(COL_ORANGE + "Syntax: end <optional: team>");
console_print(COL_ORANGE + "Ends the current round");
console_print(COL_ORANGE + "Specify <team> to select RED or BLUE as the winning team")
', console_init_access_level('end', CC_HOST_RCON));
