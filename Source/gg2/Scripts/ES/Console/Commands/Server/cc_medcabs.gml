console_addCommand("medcabs", "
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

if global.healCabs==0{
    global.healCabs=1
    console_print('Med cabinets enabled.')
}else if global.healCabs==1{
    global.healCabs=0
    console_print('Med cabinets disabled.')
}

", "
console_print('Syntax: medcaba')
console_print('Toggles use of med cabinets.')
");
