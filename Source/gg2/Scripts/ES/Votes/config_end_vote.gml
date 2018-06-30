//argument0=config name
configName=argument0

if global.configVoteAllowed==1{
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Results: '+C_GREEN+string(global.yesVotes)+' yes vote(s), '+P_RED+string(global.noVotes)+' no vote(s)')
    
    //check who won
    if global.yesVotes>global.noVotes{
        //yes wins
        config_load(configName)
        config_print_load(0,configName)
    }else if global.yesVotes<global.noVotes or global.yesVotes==global.noVotes{
        //no wins/tie
        chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Config: '+C_GREEN+configName+C_WHITE+' lost the vote, not loaded.')
    }
    
    //reset vars
    global.isVoting=0
    global.yesVotes=0
    global.noVotes=0
    ds_list_destroy(global.votedList)
}
