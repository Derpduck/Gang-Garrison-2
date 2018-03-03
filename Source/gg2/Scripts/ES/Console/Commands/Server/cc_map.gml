console_addCommand("map", "
/*
//HOST+RCON ONLY
*/
var command;
command=input[0]+' '+input[1]+' '+input[2]
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
_nextMap=input[1]
endNow=input[2]

if(!file_exists('Maps/' + _nextMap + '.png')){
    console_print(_nextMap+' is not a valid map name. Ensure you have the map in your maps folder and have typed it correctly.')
    exit;
}

global.nextMap=_nextMap
global.consoleMapChange=1

console_print('Next map set to: '+_nextMap)

if endNow=='end'{
    console_parseInput('end')
    exit;
}

with(ModController){
    event_user(0)
}
if global.chatPBF_32==1 or global.chatPBF_64==1{
    var message, color;
    message = global.chatPrintPrefix+C_WHITE+'Next map set to '+C_GREEN+_nextMap+C_WHITE+'.'
    write_ubyte(global.publicChatBuffer, CHAT_PUBLIC_MESSAGE);
    write_ushort(global.publicChatBuffer, string_length(message));
    write_string(global.publicChatBuffer, message);
    write_byte(global.publicChatBuffer,-1)
    print_to_chat(message);// For the host
}

", "
console_print('Syntax: map <map name>')
console_print('Sets the next map to the desired map.')
console_print('Append <end> to have the round end with this command.')
")
