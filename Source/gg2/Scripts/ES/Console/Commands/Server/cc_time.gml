console_addCommand("time", "
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

var time;
time=floor(real(input[1]))*30*60

if time==-1{
    console_print('Invalid time.')
    exit;
}

with(CTFHUD){
    timeLimit=time
    timer=timeLimit;
    GameServer.syncTimer=1
}
with(InvasionHUD){
    timeLimit=time
    timer=timeLimit;
    GameServer.syncTimer=1
}
with(ControlPointHUD){
    timeLimit=time
    timer=timeLimit;
    GameServer.syncTimer=1
}
with(GeneratorHUD){
    timeLimit=time
    timer=timeLimit;
    GameServer.syncTimer=1
}
with(KothHUD){
    timeLimit=time
    timer=timeLimit;
    GameServer.syncTimer=1
}
with(DKothHUD){
    timeLimit=time
    timer=timeLimit;
    GameServer.syncTimer=1
}
with(TeamDeathmatchHUD){
    timeLimit=time
    timer=timeLimit;
    GameServer.syncTimer=1
}
with(ArenaHUD){
    timeLimit=time
    ArenaHUD.timer=time
    GameServer.syncTimer=1
}
with(MGE_HUD){
    timeLimit=time
    ArenaHUD.timer=time
    GameServer.syncTimer=1
}

console_print('Round time limit changed to: '+string(time/(30*60))+' minutes.')
exit;

console_print('No time specified.')
", "
console_print('Syntax: time <number of minutes>')
console_print('Changes current time remaining.')
")
