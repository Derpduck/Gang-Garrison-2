if !global.isHost exit;

//RUP
var i,player;
global.readyTotal=0
redsize=0
bluesize=0
for(i=0; i < ds_list_size(global.players); i+=1){
    player = ds_list_find_value(global.players, i);
    //max
    if player.team == TEAM_RED{
        redsize+=1
    }else if player.team == TEAM_BLUE{
        bluesize+=1
    }
    global.readyMax=redsize+bluesize
    
    //total no.
    if player.team==TEAM_SPECTATOR{
        ds_map_replace(rupPlayers,player,0)
    }
    if ds_map_find_value(rupPlayers,player)==1{
        global.readyTotal+=1
    }
    if global.readyTotal<0{
        global.readyTotal=0
    }
}

if global.forceReady{
    global.readyTotal=global.readyMax
}
