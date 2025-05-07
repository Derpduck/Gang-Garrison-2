// Returns a console color code from a player's team
switch(argument0.team)
{
case TEAM_RED:
    return COL_RED_LT;
    break;
case TEAM_BLUE:
    return COL_BLUE_LT;
    break;
default:
    return COL_GREEN;
    break
}
