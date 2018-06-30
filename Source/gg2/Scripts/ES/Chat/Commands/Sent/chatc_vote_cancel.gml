chat_addCommandSent("c", "
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

hostCheck=ds_list_find_index(global.players,global.chatCommandPlayerID)
rconCheck=0

for (i=0; i<ds_list_size(global.players); i+=1){
    RCONPlayer=ds_list_find_value(global.RCONList,i)
    if  real(global.chatCommandPlayerID)==real(RCONPlayer){
        rconCheck=1
    }
}

if rconCheck==0{
    if hostCheck!=0{
        chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Only admins can use this command.')
        exit;
    }
}

if global.isVoting!=1{
    exit;
}


//reset vars
global.isVoting=0
global.yesVotes=0
global.noVotes=0
ds_list_destroy(global.votedList)

with (VoteHandler){
    alarm[0]=-1
    instance_destroy()
}

chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Current vote was cancelled by an admin!')

", "
console_print('Syntax: c')
console_print('Cancels the current vote.')
")

chat_addCommandSent("cancel", "
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

hostCheck=ds_list_find_index(global.players,global.chatCommandPlayerID)
rconCheck=0

for (i=0; i<ds_list_size(global.players); i+=1){
    RCONPlayer=ds_list_find_value(global.RCONList,i)
    if  real(global.chatCommandPlayerID)==real(RCONPlayer){
        rconCheck=1
    }
}

if rconCheck==0{
    if hostCheck!=0{
        chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Only admins can use this command.')
        exit;
    }
}

if global.isVoting!=1{
    exit;
}


//reset vars
global.isVoting=0
global.yesVotes=0
global.noVotes=0
ds_list_destroy(global.votedList)

with (VoteHandler){
    alarm[0]=-1
    instance_destroy()
}

chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Current vote was cancelled by an admin!')

", "
console_print('Syntax: cancel')
console_print('Cancels the current vote.')
")
