chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Results: '+C_GREEN+string(global.yesVotes)+' yes vote(s), '+P_RED+string(global.noVotes)+' no vote(s)')

//check who won
if global.yesVotes>global.noVotes{
    //yes wins
    global.winners=TEAM_SPECTATOR
    
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Vote '+C_GREEN+'successful'+C_WHITE+', ending the map!')
}else if global.yesVotes<global.noVotes or global.yesVotes==global.noVotes{
    //no wins/tie
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Vote '+C_RED+'failed'+C_WHITE+', not ending the map.')
}

//reset vars
global.isVoting=0
global.yesVotes=0
global.noVotes=0
ds_list_destroy(global.votedList)
