console_addCommand("lock", "
/*
//HOST+RCON ONLY
*/
var command;
command=input[0]
if global.isRCON==1 and !global.isHost{
    //Parse string
    var stringLength;
    stringLength=string_length(string(command))
        
    write_ubyte(global.serverSocket,RCON_COMMAND)
    write_ubyte(global.serverSocket,stringLength)
    write_string(global.serverSocket,command)
    socket_send(global.serverSocket)
    exit;
}else if !global.isHost{
    console_print('Only the host/RCON can use this command.')
    exit;
}

if global.RCONSentCommand=1{
    console_print(C_PINK+'RCON: '+global.RCONSentCommand_PlayerName+' sent this command:')
    console_print(C_ORNGE+global.RCONCommand_out)
}
if !global.isHost{
    console_print('Only the host/RCON can use this command.')
    exit;
}

if global.lockedTeams==0{
    global.lockedTeams=1
    console_print('Teams locked.')
    global.srvMsgChatPrint=global.chatPrintPrefix+C_WHITE+'Teams locked!'
    console_miscmsg()
    exit;
}else{
    global.lockedTeams=0
    console_print('Unlocked teams.')
    global.srvMsgChatPrint=global.chatPrintPrefix+C_WHITE+'Teams unlocked!'
    console_miscmsg()
    exit;
}
", "
console_print('Syntax: lock')
console_print('Prevents players from changing teams.')
")
