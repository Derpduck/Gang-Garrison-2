if global.pugVoteAllowed==1{
    voteMix=argument0
    
    if voteMix==1{
        typeString=" MIX"
    }else{
        typeString=" PUG"
    }
    
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Results: '+C_GREEN+string(global.yesVotes)+' yes vote(s), '+P_RED+string(global.noVotes)+' no vote(s)')
    
    //check who won
    if global.yesVotes>global.noVotes{
        //yes wins
        //destroy any old existing pugs
        with(PugController){
            instance_destroy()
        }
        instance_create(0,0,PugController)
        
        if voteMix==1{
            with(PugController){
                mix=1
            }
        }else if voteMix==2{
            with(PugController){
                war=1
            }
        }else{
            with(PugController){
                pug=1
            }
        }
        
        if global.pugVoteMaps<=0{
            global.pugVoteMaps=5
        }else if global.pugVoteMaps>13{
            global.pugVoteMaps=13
        }
            
        chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Vote '+C_GREEN+'successful'+C_WHITE+', starting a'+C_GREEN+typeString+'!')
    }else if global.yesVotes<global.noVotes or global.yesVotes==global.noVotes{
        //no wins/tie
        chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Vote '+C_RED+'failed'+C_WHITE+', not starting a'+C_GREEN+typeString+'.')
    }
    
    //reset vars
    global.isVoting=0
    global.yesVotes=0
    global.noVotes=0
    ds_list_destroy(global.votedList)
}
