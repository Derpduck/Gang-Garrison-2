/**
 * Resets the map (for ADCP stopwatch)
 */

//Still the same map
global.winners = -1;
global.nextMap = global.currentMap;

//Re-enable ready-up
with(ReadyUpController){
    event_user(1)
}

if global.isHost{
    chat_sendmsg(global.chatPrintPrefix+C_GREEN+"ADCP Stopwatch: "+C_WHITE+"Switching sides!")
    
    if global.currentConfig==""{
        if global.autoStart==1{
            global.forceReady=1
        }else if global.autoStart==0{
            global.forceReady=0
        }
    }
}

//Switch the teams
if global.isHost{
    for(i=0; i<ds_list_size(global.players); i+=1){
        player=ds_list_find_value(global.players,i)
        
        if player.team==TEAM_RED{
            player.team=TEAM_BLUE
        }else if player.team==TEAM_BLUE{
            player.team=TEAM_RED
        }
        
        if player.object!=-1{
            with(player.object){
                if (!instance_exists(lastDamageDealer) || lastDamageDealer == player){
                    sendEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                    doEventPlayerDeath(player, player, noone, DAMAGE_SOURCE_BID_FAREWELL);
                }else{
                    var assistant;
                    assistant = secondToLastDamageDealer;
                    if (lastDamageDealer.object){
                        if (lastDamageDealer.object.healer){
                            assistant = lastDamageDealer.object.healer;
                        }
                    }
                    sendEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                    doEventPlayerDeath(player, lastDamageDealer, assistant, DAMAGE_SOURCE_FINISHED_OFF);
                }
            }
        }
        ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
    }
}

//Reset stuff
with(ControlPointHUD){
    event_perform(ev_create,0)
}

with(ScoreTableController){
    done = true
}

with(WinBanner){
    instance_destroy()
}

with (Player) {
    humiliated = 0;
    //canSpawn = 1;
}

with(ControlPoint){
    event_user(0)
    
    team = TEAM_BLUE
    
    // Locking is done externally in Arena mode and KotH
    if(team == TEAM_BLUE){
        if(cp > 1){
            if(global.cp[cp-1].team != TEAM_RED){
                locked = true;
            }else{
                locked = false;
            }
        }
    }else if(team == TEAM_RED){
        if(cp < global.totalControlPoints){
            if(global.cp[cp+1].team != TEAM_BLUE){
                locked = true;
            }else{
                locked = false;
            }
        }
    }
    
    if(mode==1 && team == TEAM_RED){
        locked = true;
    }
}

global.currentStopwatchRound=2
