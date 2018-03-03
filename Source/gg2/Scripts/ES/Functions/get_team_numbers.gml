redteam=0;
blueteam=0;
specteam=0
for(i=0; i<ds_list_size(global.players); i+=1){
    player = ds_list_find_value(global.players, i)
    if player.team == TEAM_RED{
        redteam+=1;
    }else if player.team == TEAM_BLUE{
        blueteam+=1;
    }else if player.team == TEAM_SPECTATOR{
        specteam+=1;
    }
}
