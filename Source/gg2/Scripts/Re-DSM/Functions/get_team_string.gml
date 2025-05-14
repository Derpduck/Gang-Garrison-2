// Returns a team name from team number
switch(argument0)
{
case TEAM_RED:
    return "RED";
    break;
case TEAM_BLUE:
    return "BLUE";
    break;
case TEAM_SPECTATOR:
    return "SPECTATOR";
    break;
case TEAM_ANY:
    return "ANY";
    break;
default:
    return "Unknown";
    break;
}
