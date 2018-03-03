//Mixed vs Mixed
if global.botMode == 0 or global.botMode == 3{
    if calculate_bot_balance()==TEAM_RED{
        team = TEAM_BLUE
    }else if calculate_bot_balance()==TEAM_BLUE{
        team = TEAM_RED
    }else{
        team = choose(TEAM_RED,TEAM_BLUE)
    }
}else{ // Human vs Bots
    team = global.botChosenTeam
}

return team;
