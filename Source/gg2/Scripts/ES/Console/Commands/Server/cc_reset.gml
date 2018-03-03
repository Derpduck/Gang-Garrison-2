console_addCommand("reset", "
/*
//HOST+RCON ONLY
*/
var command;
command=input[0]+' '+input[1]
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

var _nextMap,endNow;
_nextMap=global.currentMap

if(!file_exists('Maps/' + _nextMap + '.png')){
    console_print(_nextMap+' is not a valid map name. Ensure you have the map in your maps folder and have typed it correctly.')
    exit;
}

global.nextMap=_nextMap
global.consoleMapChange=1

console_print('Restarting round.')
", "
console_print('Syntax: reset')
console_print('Restarts the round on the same map.')
")
