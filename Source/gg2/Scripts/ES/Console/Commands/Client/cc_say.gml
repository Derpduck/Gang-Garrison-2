console_addCommand("say", "
/*
//CLIENT
*/
if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
    exit
}

var message;
message=string_copy(input[1],0,CHAT_MAX_STRING_LENGTH-1)
teamMsg=input[2]

messageType=CHAT_PUBLIC_MESSAGE

if teamMsg=='team'{
    messageType=CHAT_PRIV_MESSAGE
}

//local chat command
if string_char_at(message,0)=='/'{
    ChatBox.localCommand=string_delete(message,1,1)
    with(ChatBox){
        event_user(0)
    }
}else{
    write_ubyte(global.serverSocket, messageType)
    write_ubyte(global.serverSocket, string_length(message))
    write_string(global.serverSocket, message)
    socket_send(global.serverSocket)
}

", "
console_print('Syntax: say <message>')
console_print('Append <team> to send the message in team chat.')
console_print('Sends a chat message of the string.')
")
