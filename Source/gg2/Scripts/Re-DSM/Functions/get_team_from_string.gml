// Returns a team from console input
switch(string_lower(argument0))
{
case "red":
case "r":
case "3":
    return TEAM_RED;
    break;
case "blue":
case "blu":
case "b":
case "4":
    return TEAM_BLUE;
    break;
case "spectator":
case "spec":
case "2":
    return TEAM_SPECTATOR;
    break;
case "any":
case "random":
    return TEAM_ANY;
    break;
default:
    return -1;
    break;
}
