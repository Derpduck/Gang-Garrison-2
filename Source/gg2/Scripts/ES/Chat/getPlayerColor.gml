// Decides what chat color a player should have depending on team
// argument0 == player, argument1 = public chat (boolean)
player=argument0
publicChat=argument1

if player.team == TEAM_RED{
    return P_RED;
}else if player.team == TEAM_BLUE{
    return P_BLUE;
}else{ //spectators
    return C_GREEN;
}
