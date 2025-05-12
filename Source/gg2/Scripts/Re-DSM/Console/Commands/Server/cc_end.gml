console_add_command('end', '
if (console_validate_args(1, arg[0], "end <team>", true) == false)
{
    global.winners = TEAM_SPECTATOR;
    console_print(COL_ORANGE + "Round has been ended, next map: " + COL_YELLOW + get_next_map());
}
else
{
    var winner;
    winner = string_lower(arg[1]);
    if (winner == "red" or winner == "r" or winner == "0")
    {
        global.winners = TEAM_RED;
        console_print(COL_ORANGE + "Round has been ended, " + COL_RED_LT + "RED Team" + COL_ORANGE + " wins, next map: " + COL_YELLOW + get_next_map());
    }
    else if (winner == "blue" or winner == "b" or winner == "1")
    {
        global.winners = TEAM_BLUE;
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
console_print(COL_ORANGE + "Use <team> to select the winning team: "r / red / 0 for RED Team, b / blue / 1 for BLU Team")
', CC_HOST_RCON);
