var message, color;
message = global.chatPrintPrefix+C_WHITE+'Results: '+C_GREEN+string(global.yesVotes)+' yes vote(s), '+P_RED+string(global.noVotes)+' no vote(s)'
write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE);
write_ushort(global.publicChatBuffer, string_length(message));
write_string(global.publicChatBuffer, message);
write_byte(global.publicChatBuffer,-1)
print_to_chat(message);// For the host

//check who won
if global.yesVotes>global.noVotes{
    //yes wins
    var message;
    message = global.chatPrintPrefix+C_WHITE+'Vote '+C_GREEN+'successful'+C_WHITE+', shuffling teams!'
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
    write_ushort(global.publicChatBuffer, string_length(message))
    write_string(global.publicChatBuffer, message)
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(message);// For the host
    
    //pug mode
    if global.pugMode==1 and PugController.stage<5{
        if PugController.mix==1{
            with(PugController){
                event_user(4)
            }
        //}else if PugController.mix==0{
        }
    }else{
        //Completely team scramble everyone
        var newReds,newBlues;
        newReds=0
        newBlues=0
        
        //Initial scramble
        for(i=0; i<ds_list_size(global.players); i+=1){
            newTeam=choose(0,1)
            player=ds_list_find_value(global.players,i)
            if player.team!=TEAM_SPECTATOR{
                if(getCharacterObject(newTeam, player.class) != -1){
                    with player {
                        canSpawn = 1;
                        if object != -1 with object instance_destroy();
                        alarm[5] = 1;
                    }
                }
                player.team=newTeam
                ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
                
                //Keep track of players per team
                if player.team==TEAM_RED{
                    newReds+=1
                }else if player.team==TEAM_BLUE{
                    newBlues+=1
                }
            }
        }
        
        //Check difference in player numbers for teams
        if newReds-1>newBlues{
            var difference;
            difference=(newReds-newBlues)-1
            
            for(i=0; i<difference; i+=1){
                player=ds_list_find_value(global.players,i)
                if player.team==TEAM_RED{
                    newTeam=TEAM_BLUE
                    if(getCharacterObject(newTeam, player.class) != -1){
                        with player {
                            canSpawn = 1;
                            if object != -1 with object instance_destroy();
                            alarm[5] = 1;
                        }
                    }
                    player.team=newTeam
                    ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
                }
            }
            console_print('Scramble was biased to red team, moving additional players.')
        }else if newBlues-1>newReds{
            var difference;
            difference=(newBlues-newReds)-1
            
            for(i=0; i<difference; i+=1){
                player=ds_list_find_value(global.players,i)
                if player.team==TEAM_BLUE{
                    newTeam=TEAM_RED
                    if(getCharacterObject(newTeam, player.class) != -1){
                        with player {
                            canSpawn = 1;
                            if object != -1 with object instance_destroy();
                            alarm[5] = 1;
                        }
                    }
                    player.team=newTeam
                    ServerPlayerChangeteam(ds_list_find_index(global.players,player),player.team,global.sendBuffer)
                }
            }
            console_print('Scramble was biased to blue team, moving additional players.')
        }
    }
}else if global.yesVotes<global.noVotes or global.yesVotes==global.noVotes{
    //no wins/tie
    var message, color;
    message = global.chatPrintPrefix+C_WHITE+'Vote '+C_RED+'failed'+C_WHITE+', not shuffling teams.'
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE);
    write_ushort(global.publicChatBuffer, string_length(message));
    write_string(global.publicChatBuffer, message);
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(message);// For the host
}

//reset vars
global.isVoting=0
global.yesVotes=0
global.noVotes=0
ds_list_destroy(global.votedList)
