chat_addCommandSent("y", "
/*
//HOST ONLY
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

if !global.isHost{
    console_print('Only the host can use this command.')
    exit;
}

if global.isVoting!=1{
    exit;
}

player=global.chatCommandPlayerID

if ds_list_find_index(global.votedList,player)!=-1{
    //player has already voted, discard
    exit;
}else{
    ds_list_add(global.votedList,player)
    global.yesVotes+=1
    
    var message, color;
    color = getPlayerColor(player, true);
    chat_sendmsg(global.chatPrintPrefix+color+c_filter(player.name)+C_WHITE+' has voted '+C_GREEN+'yes'+C_WHITE+'!')
    
    exit;
}

", "
console_print('Syntax: y')
console_print('Vote yes.')
")
