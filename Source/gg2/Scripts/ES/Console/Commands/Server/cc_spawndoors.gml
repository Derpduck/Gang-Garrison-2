console_addCommand("spawndoors", "
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

if global.spawnDoors==0{
    global.spawnDoors=1
    console_print('Spawn doors enabled.')
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Spawn doors enabled by admin.',global.printAdminCC)
}else if global.spawnDoors==1{
    global.spawnDoors=0
    console_print('Spawn doors disabled.')
    chat_sendmsg(global.chatPrintPrefix+C_WHITE+'Spawn doors disabled by admin.',global.printAdminCC)
}

", "
console_print('Syntax: spawndoors')
console_print('Toggles use of spawn doors.')
");
