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
    global.winners=TEAM_SPECTATOR
    
    var message;
    message = global.chatPrintPrefix+C_WHITE+'Vote '+C_GREEN+'successful'+C_WHITE+', ending the map!'
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE)
    write_ushort(global.publicChatBuffer, string_length(message))
    write_string(global.publicChatBuffer, message)
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(message);// For the host
    
}else if global.yesVotes<global.noVotes or global.yesVotes==global.noVotes{
    //no wins/tie
    var message, color;
    message = global.chatPrintPrefix+C_WHITE+'Vote '+C_RED+'failed'+C_WHITE+', not ending the map.'
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
