console_addCommand("end", "
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

global.winners=TEAM_SPECTATOR

if input[1]==string_lower('red') or input[1]=='1'{
    global.winners=TEAM_RED
}

if input[1]==string_lower('blue') or input[1]=='2'{
    global.winners=TEAM_BLUE
}

console_print('Round ended.')
chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Round has been ended by admin.',global.printAdminCC)
", "
console_print('Syntax: end')
console_print('End the round. Specify <red> or <blue> to make it a win for that team, otherwise, round will count as a stalemate.')
")
