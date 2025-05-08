console_add_command('end', '
if (console_validate_args(1, arg[0], "end <text>", true) == false)
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
}
', '
console_print("Syntax: message <text>);
console_print("Sends all clients a notification bearing the message");
', CC_HOST_RCON);
