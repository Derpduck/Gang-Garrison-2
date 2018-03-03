console_addCommand("slots", "
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

var newLimit;
newLimit=round(real(string_digits(input[1])))

if global.playerLimit==newLimit{
    console_print('Attempting to change number of slots to current number of slots; remains unchanged.')
    exit;
}

if newLimit > 48{
    console_print('Player limit cannot be set above 48; setting to 48.')
}

var classlimittotal;
classlimittotal=0
for(i=0;i<10;i+=1){
    classlimittotal+=global.classlimits[i]
}
if classlimittotal<floor(global.playerLimit/2){
    console_print('Warning: Player limit exceeds classlimits; classlimits may not work properly.')
}

if newLimit!=-1{
    global.playerLimit=min(48,newLimit)
    console_print('Slots set to: '+string(global.playerLimit))
    global.srvMsgChatPrint=global.chatPrintPrefix+C_WHITE+'Slots set to: '+C_GREEN+string(global.playerLimit)+C_WHITE+'.'
    console_miscmsg()
    exit;
}
console_print('Invalid or no input.')
", "
console_print('Syntax: slots <number of slots>')
console_print('Changes the current player limit.')
")
